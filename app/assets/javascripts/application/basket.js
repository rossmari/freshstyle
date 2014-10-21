$(document).ready(function() {
    cookie.defaults.expires = 2;
    cookie.defaults.path = '/';

    var localBasket = [];

    check_basket();
    update_basket_label();

    $(document).on('click', '.add_good_to_basket', function(event) {
        event.preventDefault();
        if ($('.sizes').find('.active').length < 1) {
            $('#size_alert').show();
            return;
        } else {
            var size = $('.sizes').find('.active').find('input').val();
            $('#size_alert').hide();
        }

        var good_id = $(this).data('good-id');
        if (check_goods_count(good_id)) {
            add_good(good_id, size);
            up_basket_label();
            alert('Товар добавлен в корзину!')
        } else {
            alert('Товар не добавлен в корзину!\nКоличество товара на складе ограничено!')
        }
    });

    $(document).on('click', '.remove_good_from_basket', function(event) {
        event.preventDefault();
        var target = $(event.currentTarget);
        var good_id = target.data('good-id');
        var size = target.parent().find('.size').data('size');
        remove_good(good_id, size);
    });

    $(document).on('click', '.clear_basket', function(event) {
        event.preventDefault();
        clear_basket();
    });

    function add_good(good_id, size) {
        localBasket.push({id: good_id, size: size});
        update_basket();
    }

    function remove_good(good_id, size) {
        var index = -1;
        $.each(localBasket, function(i, element) {
            if (element['id'] == good_id && element['size'] == size) {
                index = i;
            }
        });

        if (index > -1) {
            localBasket.splice(index, 1);
            location.reload();
        }
        update_basket();
        location.reload();
    }

    function update_basket() {
        var text = JSON.stringify(localBasket);
        cookie.set('basket', text);
    }

    function check_basket() {
        if (cookie.get('basket') == null || cookie.get('basket') == "") {
            cookie.set('basket', []);
        } else {
            localBasket = JSON.parse(cookie.get('basket'));
        }
    }

    function clear_basket() {
        localBasket = [];
        cookie.set('basket', []);
        location.reload();
    }

    function up_basket_label() {
        var label = $('.basket_count_label');
        var new_count = parseInt(label.text()) + 1;
        label.text(new_count);
    }

    function update_basket_label() {
        var label = $('.basket_count_label');
        label.text(localBasket.length);
    }

    function check_goods_count(good_id) {
        var goods = $.grep(localBasket, function(a) {
            return a['id'] == good_id;
        });
        return goods.length < $('#goods_count_in_stock').val();
    }
});
