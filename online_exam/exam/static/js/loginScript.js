$(document).ready(function(){
    $('#loginBtn').on('click',function(){
        $.ajax({
            url: "/",
            type: "POST",
            data:{  'username':$('#username').val(),
                    'password':$('#password').val(),
                    'csrfmiddlewaretoken' : $('input[name=csrfmiddlewaretoken]').val()
                 },
            dataType:"JSON",
            success: function(response) {
            $('#test').append(response.html_form);
                //$('#loginModal').hide();
                //alert(response);
                /*if(response.status==1){
                    swal("Success!", "Successfully Updated!", "success");
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }*/
            }
        });
    });
});