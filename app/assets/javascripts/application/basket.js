$(document).ready(function() {

    var localBasket = [];
    check_basket();

    $(document).on('click', '.add_good_to_basket', function(event){
        event.preventDefault();
        var good_id = $(this).data('goodId');
        add_good(good_id);
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

    function add_good(good_id){
        localBasket.push(good_id);
        update_basket();
    }

    function remove_good(good_id){
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

});