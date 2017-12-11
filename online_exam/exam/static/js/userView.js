$(document).ready(function(){
    var userID=$('#profileUserID').html();
    $('#userLink').on('click',function(){
        $('#userListTbl').DataTable({
            destroy: true,
            ajax: {
                    "url": '/getUserList/',
                    "dataSrc": function ( json ) {
                            return json;
                        }
                    },
            columns: [
                { "data": "id" },
                { "data": "username" },
                { "data": "user_contact" },
                { "data": "email" },
                { "data": "is_active",
                    render: function (data, type, row) {
                        return data === true ?
                        data.toString().replace( data, 'Active' ) :
                        data.toString().replace( data, 'Inactive' );
                    }
                },
                { "data": "is_staff",
                    render: function (data, type, row) {
                        return data === true ?
                        data.toString().replace( data, 'Admin' ) :
                        data.toString().replace( data, 'User' );
                    }
                }
            ]
        });
    });

    $('#userListTbl tbody').on('click','tr', function(){
        var userTbl = $('#userListTbl').DataTable();
        var tData = userTbl.row( this ).data() ;
        var is_active = tData['is_active'] ? 1 : 0;
        var is_staff = tData['is_staff'] ? 1 : 0;
        if(tData['id']==userID){
            swal("Error!", "User can't change own status or type!", "error");
        }
        else{
            $('#userEditModal').modal('show');
            $('#userEditID').html(tData['id']);
            $('#userEditName').html(tData['username']);
            $('#userEditContact').html(tData['user_contact']);
            $('#userEditEmail').html(tData['email']);
            $('#userEditStatus').val(is_active);
            $('#userEditType').val(is_staff);
        }
    });

    $('#userEditBtn').on('click',function(){
        var userTbl = $('#userListTbl').DataTable();
        $.ajax({
            url: "/user_update/",
            type: "GET",
            data:{  'user_id':$('#userEditID').html(),
                    'is_staff':$('#userEditType').val(),
                    'is_active':$('#userEditStatus').val()
                 },
            dataType:"JSON",
            success: function(response) {
                if(response.status==1){
                    swal("Success!", "Successfully Updated!", "success");
                    $('#userEditModal').modal('hide');
                    userTbl.ajax.reload();
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }
            }
        });
    });

});
