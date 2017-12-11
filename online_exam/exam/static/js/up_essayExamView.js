$(document).ready(function() {
    $('#essayExamLink').on('click',function(){
        $.ajax({
            url: "/test/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                $("#essayExamSubjectList").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response,function(index,row){
                        $.each(row, function(k, v){
                            //console.log(v.subject_id);
                            $("#essayExamSubjectList")
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

    $('#essayExamSubjectList').on('change',function(){
        $.ajax({
            url: "/test_info_list/",
            type: "GET",
            data: {'subject_id':$('#essayExamSubjectList').val(),
                    'test_type':2},
            success: function(newData){
                $('.quesController').html(newData);
            }
        });
        getTestID();
    });
    
    $('#essayTestStartBtn').on('click',function(){
        var essayExamTest_id = $(this).data('test');
        var essayExamTest_time = $(this).data('time');
        var collapseID=essayExamTest_id.toString().substring(3, 5)
        var prevCollapseID=essayExamTest_id.toString().substring(3, 5)=='01'?'01':(essayExamTest_id-10).toString().substring(3, 5);
        $.ajax({
            url: "/essay_ques_info/",
            type: "GET",
            data: {'test_id':essayExamTest_id},
            success: function(newData){
                $('.essayExamQuesList').html(newData);
                $('#collapse'+prevCollapseID).collapse('hide');
                $('#collapse'+collapseID).collapse('show');
                $('#mcqExamTimer').data('timer', (essayExamTest_time*60));
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

    function getTestID(){
        $.ajax({
            url: "/user_test_id/",
            type: "GET",
            data: {'subject_id':$('#essayExamSubjectList').val(),
                    'test_type':2,
                    'user_id':$('#profileUserID').html()},
            dataType:"JSON",
            success: function(response) {
                if(response.length!=0){
                    console.log(response.test_time);
                    $('#essayTestStartBtn').data('test',response.examTestID);
                    $('#essayTestStartBtn').data('time',response.test_time);
                }
            }
        });
    }

    $('#essayAnsSubmitBtn').on('click',function(){
        get_ans_submit();
    });

    function get_ans_submit(){
        userID=$('#profileUserID').html();
        var val = [];
        $('.essayAns').each(function(){
            var row={};
            $(this).each(function(i){
                row['ques'] =  $(this).data("qid");
                row['ans'] = $(this).val();
            });
            val.push(row);
        });
        console.log(val);
        $.ajax({
            url: "/essay_ans_submit/",
            type: "POST",
            data: {obj:JSON.stringify(val),
            'csrfmiddlewaretoken' : $("input[name=csrfmiddlewaretoken]").val(),
            'test_id':$('#essayTestStartBtn').data('test'),
            'user_id':userID},
             dataType:"JSON",
            success: function(response) {
                //console.log(response);
                console.log(response.status);
                if(response.status=='1'){
                    swal("Success!", "Successfully Inserted!", "success");
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }
            }
        });
    }
 });