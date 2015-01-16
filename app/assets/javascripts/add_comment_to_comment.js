$(document).ready(function(){
    $('a[href^="#"]').click(function(){
        var el = $(this).attr('href');
        name_of_user = $(this).attr('name');
        $(':text#you_comment').val(name_of_user+", ");
        $('body').animate({
            scrollTop: $(el).offset().top}, 2500);
        return false;

    });

});
