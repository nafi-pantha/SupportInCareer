$(document).ready(function(){
    $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
    $('#essayQuesEditTbl').hide();
    $('#essayLink').on('click',function(){
        $.ajax({
            url: "/test/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                //console.log(response);
                $("#essaySubjectList").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response,function(index,row){
                        $.each(row, function(k, v){
                            //console.log(v.subject_id);
                            $("#essaySubjectList")
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

    $('#essaySubjectList').on('change',function(){
        $("#essayQuesTbl").find('tr').not(':first').remove();
        //console.log("Test");
        $.ajax({
            url: "/test_list/",
            type: "GET",
            data: {'subject_id':$('#essaySubjectList').val(),
                   'test_type':2},
            dataType:"JSON",
            success: function(response) {
                var data=response;
                $("#essayTestList").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response,function(index,row){
                        $.each(row, function(k, v){
                            $("#essayTestList")
                            .append(
                                $("<option></option>")
                                    .text(v.test_id.toString().substring(3, 5)+': '+v.test_name)
                                    .val(v.test_id)
                            );
                        });
                    });
                }
            }
        });
    });

    $('#essayTestList').on('change',function(){
      $("#essayQuesTbl").find('tr').not(':first').remove();
        $.ajax({
            url: "/test_info/",
            type: "GET",
            data: {'subject_id':$('#essaySubjectList').val(),
                   'test_type':2,
                   'test_id' : $('#essayTestList').val()},
            dataType:"JSON",
            success: function(response) {
                $('#essayMaxQuesNo').text(response.results[0].test_total_questions);
                $('#essayExamTime').text(response.results[0].test_totaltimes);
                $('#essayTotalMarks').text(response.results[0].test_totalmarks);
                //mcq_available_check();
                get_essay_ques_data();
            }
        });
    });

    $('#essayQuesSubBtn').on('click',function(){
        $("#essayQuesTbl").find('tr').not(':first').remove();
        var quesLimit=$("#essayMaxQuesNo").text();
        var trHTML = '';
        for(var i=1;i<=quesLimit;i++){
            trHTML+= '<tr id='+i+'><td><span>'+i+'</span><input type="text" class="form-control hidden" id="qid" name="qid" value="'+i+'"></td>'+
            '<td><textarea class="form-control vresize ques" name="ques" placeholder="Question" required></textarea></td>'+
            /*'<td><input type="text" class="form-control" id="ques" name="ques" placeholder="Question"></td>'+
            '<td><input type="text" class="form-control" id="mark" name="mark" placeholder="Mark"></td>';*/
            '<td><select class="form-control mark" name="mark"></select></td></tr>';
        }
        $('#essayQuesTbl').append(trHTML);
        getMarkOptions();
    });

    $('#essaySubmitBtn').on('click',function(){
        var data=[];
        $('#essayQuesTbl').find('tr:not(:has(th))').each(function(){
            var id=$(this).attr('id');
            var row={};
            $(this).find(':input').each(function(){
                row[$(this).attr('name')]=$(this).val();
            });
            data.push(row);
        });
        console.log(data);
        $.ajax({
            url: "/essay_paper_submit/",
            type: "POST",
            data: {obj:JSON.stringify(data),
            'csrfmiddlewaretoken' : $("input[name=csrfmiddlewaretoken]").val(),
            'test_id':$('#essayTestList').val(),
            'essay_summary':$('#essaySummary').val()},
            dataType:"JSON",
            success: function(response) {
                //console.log(response);
                console.log("Test");
                if(response.status==1){
                    swal("Success!", "Successfully Updated!", "success");
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }
            }
        });
    });

    function essay_available_check(){
        $.ajax({
            url: "/essay_available_check/",
            type: "GET",
            data: {'test_id':$('#essayTestList').val()},
            dataType:"JSON",
            success: function(response) {
                if(response){
                    $("#essayQuesEditTbl").find('tr').not(':first').remove();
                    var trHTML = '';
                    $.each(response, function (key,value) {
                        trHTML +='<tr data-id="'+value.essay_question_id+'" data-ques="'+value.essay_question+'" data-marks="'+value.essay_question_marks+'">'+
                        '<td data-id="'+value.essay_question_id+'">' + value.essay_question_id +'</td>'+
                        '<td>' + value.essay_question +'</td>'+
                        '<td>' + value.essay_question_marks +'</td></tr>';
                    });
                    $('#essayQuesEditTbl').append(trHTML);
                }
            }
        });
    }

    $('#essayQuesEditTbl').on('click','tr', function(){
        console.log("aghg");
        $('#quesEditModalforEditSection').modal('show');
        $('#essayQuesIDEdit').val($(this).attr("data-id"));
        $('#essayQuesEdit').val($(this).attr("data-ques"));
        $('#questionMarkEdit').val($(this).attr("data-marks"));
    });

    $('#essayQuesEditBtn').on('click',function(){
        $.unblockUI();
        $('#quesEditModalforEditSection').modal('hide');
        $.ajax({
            url: "/essay_ques_edit/",
            type: "GET",
            data: {'test_id': $('#essayTestList').val(),
                    'essay_ques_id': $('#essayQuesIDEdit').val(),
                    'essay_ques': $('#essayQuesEdit').val(),
                    'essay_question_marks': $('#questionMarkEdit').val(),
                    },
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


    function get_essay_ques_data(){
        $.ajax({
            url: "/get_essay_ques_data/",
            type: "GET",
            data: {'test_id': $('#essayTestList').val()},
            dataType:"JSON",
            success: function(response) {
                //console.log(response.status);
                if(response.status==0){
                    $('#essayEditBtn').prop('disabled',true);
                    $('#essayQuesSubBtn').prop('disabled',false);
                }
                else{
                    $('#essayEditBtn').prop('disabled',false);
                    $('#essayQuesSubBtn').prop('disabled',true);
                }
            }
        });
    }

    $('#essayEditBtn').on('click',function(){
        $('#essayQuesEditTbl').show();
        $('#essayQuesTbl').hide();
        essay_available_check();
    });
    function getMarkOptions(){
        $('.mark').each(function(index,row){
            for(var i=1; i<= 10; i++){
                 $(this).append($("<option></option>").text(i).val(i));
            }
        });
    }
});
