$(document).ready(function(){
    $('#subjectLink').on('click',function(){
        $.ajax({
            url: "/test/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                if(response){
                    $("#subjectEditTbl").find('tr').not(':first').remove();
                    var trHTML = '';
                    $.each(response,function(index,row){
                        $.each(row, function(key, value){
                            //console.log(v.subject_id);
                            trHTML +='<tr data-id="'+value.subject_id+'" data-subName="'+value.subject_name+'" data-mcq_total_test="'+value.mcq_total_test+'" data-essay_total_test="'+value.essay_total_test+'">'+
                        '<td data-id="'+value.subject_id+'">' + value.subject_id +'</td>'+
                        '<td>' + value.subject_name +'</td>'+
                        '<td>' + value.mcq_total_test +'</td>'+
                        '<td>' + value.essay_total_test +'</td>';
                        });
                    });
                    $('#subjectEditTbl').append(trHTML);
                }
            }
        });
    });
    $('#subjectEditTbl').on('click','tr', function(){
        $('#subjectID').val($(this).attr("data-id"));
        $('#subjectName').val($(this).attr("data-subName"));
        $('#mcqTotalQues').val($(this).attr("data-mcq_total_test"));
        $('#essayTotalQues').val($(this).attr("data-essay_total_test"));
    });

    $('#subjectSaveBtn').on('click',function(){
        $.ajax({
            url: "/subject_insert/",
            type: "GET",
            data: {'subjectName':  $('#subjectName').val(),
                     'mcqTotalQues': $('#mcqTotalQues').val(),
                     'essayTotalQues': $('#essayTotalQues').val()},
            dataType:"JSON",
            success: function(response) {
                if(response.status==1){
                    swal("Success!", "Successfully Updated!", "success");
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }
            }
        });

    });


});