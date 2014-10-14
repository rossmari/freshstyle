$(document).ready(function() {

    $('.preview').on('click', function(event){
        event.preventDefault();
        event.stopPropagation();
        var original = $(this).data('big');
        $('.big_image').find('img').prop('src', original);
    });


    $(".fancybox").fancybox();
});
