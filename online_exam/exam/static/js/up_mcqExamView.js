$(document).ready(function(){
    $('#mcqExamLink').on('click',function(){
        $.ajax({
            url: "/test/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                $("#mcqExamSubjectList").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response,function(index,row){
                        $.each(row, function(k, v){
                            //console.log(v.subject_id);
                            $("#mcqExamSubjectList")
                            .append(
                                $("<option></option>")
                                    .text(v.subject_id+':'+v.subject_name)
                                    .val(v.subject_id)
                            );
                        });
                    });
                }
            }
        });
    });
    function getTestID(){
        $.ajax({
            url: "/user_test_id/",
            type: "GET",
            data: {'subject_id':$('#mcqExamSubjectList').val(),
                    'test_type':1,
                    'user_id':$('#profileUserID').html()},
            dataType:"JSON",
            success: function(response) {
                if(response.length!=0){
                    console.log(response.test_time);
                    $('#mcqTestStartBtn').data('test',response.examTestID);
                    $('#mcqTestStartBtn').data('time',response.test_time);
                }
            }
        });
    }
    $('#mcqExamSubjectList').on('change',function(){
        $.ajax({
            url: "/test_info_list/",
            type: "GET",
            data: {'subject_id':$('#mcqExamSubjectList').val(),
                    'test_type':1},
            success: function(newData){
                $('.quesController').html(newData);
            }
        });
        getTestID();
    });

    $('#mcqTestStartBtn').on('click',function(){
        var mcqExamTest_id = $(this).data('test');
        var mcqExamTest_time = $(this).data('time');
        var collapseID=mcqExamTest_id.toString().substring(3, 5)
        var prevCollapseID=mcqExamTest_id.toString().substring(3, 5)=='01'?'01':(mcqExamTest_id-10).toString().substring(3, 5);
        $.ajax({
            url: "/ques_info/",
            type: "GET",
            data: {'test_id':mcqExamTest_id},
            success: function(newData){
                $('.mcqExamQuesList').html(newData);
                $('#collapse'+prevCollapseID).collapse('hide');
                $('#collapse'+collapseID).collapse('show');
                $('#mcqExamTimer').data('timer', (mcqExamTest_time*60));
                $("#mcqExamTimer").TimeCircles(
                    { time: {
                        Days: { show: false },
                        Hours: { color: "#C0C8CF" },
                        Minutes: { color: "#C0C8CF" },
                        Seconds: { color: "#C0C8CF" }
                    }}
                ).addListener(function(unit, value, total) {
                    if(total==120){
                        swal({
                            position: 'top-right',
                            type: 'warning',
                            title: 'Hurry up!!! 2 minutes left!!!',
                            showConfirmButton: false,
                            timer: 2500,
                            toast:true
                        });
                    }
                    if(total <= 0){
                        $('#mcqExamTimer').TimeCircles().destroy();
                        get_ans_submit();
                    }
                });
            }
        });
    });

    $('#mcqAnsSubmitBtn').on('click',function(){
        get_ans_submit();
    });

    function get_ans_submit(){
        userID=$('#profileUserID').html();
        var val = [];
        $('.item input:checked').each(function(){
            var row={};
            $(this).each(function(i){
                row['ques'] =  $(this).data("qid");
                row['ans'] = $(this).val();
            });
            val.push(row);
        });
        console.log(val);
        $.ajax({
            url: "/mcq_ans_submit/",
            type: "POST",
            data: {obj:JSON.stringify(val),
            'csrfmiddlewaretoken' : $("input[name=csrfmiddlewaretoken]").val(),
            'test_id':$('#mcqTestStartBtn').data('test'),
            'user_id':userID},
            dataType:"JSON",
            success: function(response) {
                //console.log(response);
                console.log(response.status);
                if(response.status=='1'){
                    swal("Success!", "Successfully Inserted!", "success");
                    get_user_result();
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }
            }
        });
    }
    function get_user_result(){
        userID=$('#profileUserID').html();
        $.ajax({
            url: "/get_user_result/",
            type: "GET",
            data: {'test_id':$('#mcqTestStartBtn').data('test'),
                    'user_id':userID},
            dataType:"JSON",
            success: function(response) {
                $('#mcqTestStartBtn').data('test',response.result_list[0].next_test_id);
                $('#mcqTestStartBtn').data('time',response.result_list[0].test_time);
                passStatus=response.result_list[0].result_status==1?'Passed':'Failed';
                statText='<table class="table"><tr><td>Correct Answer: </td><td>'+response.result_list[0].gained_marks+'</td></tr>'+
                         '<tr><td>Wrong Answer: </td><td>'+(response.result_list[0].total_marks-response.result_list[0].gained_marks)+'</td></tr>'+
                         '<tr><td>Percentage: </td><td>'+response.result_list[0].gained_percentage+'</td></tr>'+
                         '<tr><td>Status: </td><td>'+passStatus+'</td></tr></table>';
                if(response.result_list[0].result_status==0){
                    swal({
                        title: 'Sorry!!! Please try again...',
                        type: 'error',
                        html: statText,
                        showCloseButton: true,
                    });
                    $('#user_mcqExamStats_Score').html(response.result_list[0].gained_marks);
                    $('#user_mcqExamStats_Status').html(passStatus).css('color', 'red');
                }
                else{
                    swal({
                        title: 'Congratulations!!!',
                        type: 'success',
                        html: statText,
                        showCloseButton: true,
                    });
                    $('#user_mcqExamStats_Score').html(response.result_list[0].gained_marks);
                    $('#user_mcqExamStats_Status').html(passStatus).css('color', 'green');
                }
            }
        });
    }

});
