$(document).ready(function(){
    $('#registerLink').on('click' ,function(){
        $('.card').addClass('flipped');
    });

    $('#loginLink').on('click' ,function(){
        $('.card').removeClass('flipped');
    });

    $("#regform").validate();
});