$(document).ready(function() {

    cookie.defaults.path = '/';
    var localBasket = [];
    check_basket();
    update_basket_label();

    $(document).on('click', '.add_good_to_basket', function(event){
        event.preventDefault();

        if($('.sizes').find('.active').length < 1) {
            $('#size_alert').show();
            return;
        }
            else {
            var size = $('.sizes').find('.active').find('input').prop('value')
            $('#size_alert').hide();
        }

        var good_id = $(this).data('goodId');
        add_good(good_id, size);
        up_basket_label();
        alert('Товар добавлен в корзину!')
    })

    $(document).on('click', '.remove_good_from_basket', function(event){
        event.preventDefault();
        var good_id = $(this).data('goodId');
        remove_good(good_id);
    })

    $(document).on('click', '.clear_basket', function(event){
        event.preventDefault();
        clear_basket();
    })

    function add_good(good_id, size){
        localBasket.push({id: good_id, size: size});
        update_basket();
    }

    function remove_good(good_id){
// TODO : update function to delete not just id but {id, size} hash
        var index = localBasket.indexOf(good_id);
        if (index > -1) {
            localBasket.splice(index, 1);
        }
        update_basket();
    }

    function update_basket(){
        var text = JSON.stringify(localBasket);
        cookie.set('basket', text);
    }

    function check_basket(){
        if(cookie.get('basket') == null || cookie.get('basket') == "")
        {
            cookie.set('basket', []);
        }
        else
        {
            localBasket = JSON.parse(cookie.get('basket'));
        }
    }

    function clear_basket(){
        localBasket = [];
        cookie.set('basket', []);
    }

    function up_basket_label()
    {
        var label = $('.basket_count_label')
        var new_count = parseInt(label.prop('innerText')) + 1;
        label.prop('innerText', new_count);
    }

    function update_basket_label()
    {
        var label = $('.basket_count_label')
        label.prop('innerText', localBasket.length);
    }

});