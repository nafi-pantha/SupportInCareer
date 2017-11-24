$(document).ready(function(){
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
                        data.toString().replace( data, 'Yes' ) :
                        data.toString().replace( data, 'No' );
                    }
                },
                { "data": "is_staff",
                    render: function (data, type, row) {
                        return data === true ?
                        data.toString().replace( data, 'Yes' ) :
                        data.toString().replace( data, 'No' );
                    }
                }
            ]
        });
    });

    $('#userListTbl').on('click','tr', function(){
        $('#userEditModal').modal('show');
        var userTbl = $('#userListTbl').DataTable();
        var tData = userTbl.row( this ).data() ;
        $('#userEditID').html(tData['id']);
        $('#userEditName').html(tData['username']);
        $('#userEditContact').html(tData['user_contact']);
        $('#userEditEmail').html(tData['email']);
    });
});
