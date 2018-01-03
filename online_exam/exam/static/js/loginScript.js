$(document).ready(function(){
    $('.picture_slide_main').owlCarousel({
        margin:10,
        loop:true,
        items: 1,
        center: true,
        autoplay: true,
        autoplayTimeout:2500,
        autoplayHoverPause:true,
        animateOut: 'fadeOut'
    });
    $('#registerLink').on('click' ,function(){
        $('.card').addClass('flipped');
    });

    $('#loginLink').on('click' ,function(){
        $('.card').removeClass('flipped');
    });


    //Register Validtion
    $.validator.setDefaults({
        errorClass: 'help-block',
        highlight: function(element) {
          $(element)
            .closest('.form-group')
            .addClass('has-error');
        },
        unhighlight: function(element) {
          $(element)
            .closest('.form-group')
            .removeClass('has-error').addClass('has-success');
        },
        errorPlacement: function (error, element) {
            if (element.prop('type') === 'checkbox') {
            error.insertAfter(element.parent());
            }
            else {
                error.insertAfter(element);
            }
        },
        onkeyup: function(element) {
            if (element.name == 'username'|| element.name == 'email') {
                return true;
            }
            if ( element.name in this.submitted || element ==
                this.lastElement ) {
                this.element(element);
            }
        }
    });

    $.validator.addMethod('strongPassword', function(value, element) {
        return this.optional(element)
          || value.length >= 7
          && /\d/.test(value)
          && /[a-z]/i.test(value);
    }, 'Must contain at least one number and one char');

    $(document).on('blur','#regform input',function(){
        $.unblockUI();
    });

    $("#regFrom").validate({
        onkeyup: false,
        rules: {
            userName:{
                required: true,
                minlength: 5,
                remote: "/username_Check/"
            },
            email: {
                required: true,
                email: true,
                remote: "/email_Check/"
            },
            pwd: {
                required: true,
                strongPassword: true
            },
            password2: {
                equalTo: "#pwd"
            },
            phone: {
                required: true,
                digits: true,
                phonesUK: true
            },
            userContact: {
                digits: true,
                minlength: 11
            },
            messages: {
                email: {
                    required: 'Please enter an email address',
                    email: 'Please enter a <em>valid</em> email address',
                    remote: $.validator.format("{0} is already associated with an account")
                }
            }
        },submitHandler: function(form) {
            $.ajax({
                type: $(form).attr('method'),
                url: /user_registration/,
                data: $(form).serialize(),
                success: function(response) {
                    if(response.status=='1'){
                        msgText='<p>Please login to your email to activate the account</p>'+
                                '<p>If you face any problem during activation or login please contact our admins.</p>'+
                                '<p>Contact: 01727210244</p>';
                        swal({
                            title: 'Account created successfully!!!',
                            type: 'success',
                            html: msgText,
                            showCloseButton: true,
                        });
                    }
                    else{
                        swal({
                            position: 'top-right',
                            type: 'error',
                            title: 'Please try again!!!',
                            showConfirmButton: false,
                            timer: 2000,
                            toast:true
                        });
                    }
                }
            });
        }
    });

    $("#loginForm").validate({
        rules: {
            username:{
                required: true
            },
            password: {
                required: true
            }
        },submitHandler: function(form) {
            $.ajax({
                type: $(form).attr('method'),
                url: /user_login/,
                data: $(form).serialize(),
                success: function(response) {
                    if(response.status=='1'){
                        window.location = "/"
                    }
                    if(response.status=='2'){
                        swal({
                            position: 'top-right',
                            type: 'error',
                            title: 'Username or Password Wrong or Account not activated!!!',
                            showConfirmButton: false,
                            timer: 2000,
                            toast:true
                        });
                    }
                }
            });
        }
    });

});


/*
,
        submitHandler: function(form) {
            $.ajax({
                type: $(form).attr('method'),
                url: /user_login/,
                data: $(form).serialize(),
                success: function(response) {
                    if(response.results=='1'){
                        window.location.href = "{% url 'home' %}"
                    }
                    if(response.results=='2'){
                        swal("Error!", "Login Failed!", "error");
                    }
                }
            });
        }
*/