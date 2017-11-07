$(document).ready(function(){
    $('#editBtn').prop('disabled',true);
    $('#testLink').on('click',function(){
        $.ajax({
            url: "/test/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                var data=response;
                $("#subjectList").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response,function(index,row){
                        $.each(row, function(k, v){
                            $("#subjectList")
                            .append(
                                $("<option></option>")
                                    .text(v.subject_id+':'+v.subject_name)
                                    .val(v.subject_id)
                            );
                        });
                    });
                    $('#subjectList').on('change',function(){
                        $('#testTypeList').prop('selectedIndex',0);
                        var subjectID = $('#subjectList').val();
                        var returnedData = $.grep(data.results, function(element, index){
                            return (element.subject_id == subjectID);
                        });
                        $('#mcq_tt').val(returnedData[0].mcq_total_test);
                        $('#essay_tt').val(returnedData[0].essay_total_test);
                    });
                }
            }
        });
    });
    $('#testTypeList').on('change',function(){
        var subjectID = $('#subjectList').val();
        var testTypeID = $('#testTypeList').val();
        var mcq_tt=$('#mcq_tt').val();
        var essay_tt=$('#essay_tt').val();
        $("#testIDList").find('option').not(':first').remove();
        if(testTypeID==1){
            for(var i=1; i<=mcq_tt;i++){
                var testNum=$.trim(i).length === 1 ? '0' + i : i;
                $("#testIDList").append($("<option></option>").text('Test: ' +testNum).val(subjectID+testNum+testTypeID));
            }
        }
        else{
            for(var i=1; i<=essay_tt;i++){
                var testNum=$.trim(i).length === 1 ? '0' + i : i;
                $("#testIDList").append($("<option></option>").text('Test: ' +testNum).val(subjectID+testNum+testTypeID));
            }
        }
    });
    $('#testTotalQues').on('change',function(){
        $('#quesNo').html($('#testTotalQues').val());
    });
    $('#unitMark').on('change',function(){
        var quesNo=$('#quesNo').text();
        $('#totalMarks').val(quesNo*($('#unitMark').val()));
    });
    $('#testIDList').on('change',function(){
        console.log($('#testIDList').val());
        $.ajax({
            url: "/test_available_check/",
            type: "GET",
            data:{'test_id':$('#testIDList').val()},
            dataType:"JSON",
            success: function(response) {
                if(response!=0){
                    console.log(response.results[0].test_name);
                    $("#subjectList").prop('disabled',true);
                    $("#testTypeList").prop('disabled',true);
                    $("#testIDList").prop('disabled',true);
                    $("#testName").val(response.results[0].test_name).prop('disabled',true);
                    $("#testTotalQues").val(response.results[0].test_total_questions).prop('disabled',true);
                    $("#totalMarks").val(response.results[0].test_totalmarks);
                    $("#totalTime").val(response.results[0].test_totaltimes).prop('disabled',true);
                    $("#editBtn").prop('disabled',false);
                    $("#submitBtn").prop('disabled',true);
                }
            }
        });
    });
    $('#editBtn').on('click',function(){
        $("#testName").prop('disabled',false);
        $("#testTotalQues").val('').prop('disabled',false);
        $("#totalMarks").val('');
        $("#totalTime").prop('disabled',false);
        $("#submitBtn").prop('disabled',false);
        $("#submitBtn").prop('disabled',false);
        $(this).prop('disabled',true);
        $("#mode").val(1);
    });
    $('#submitBtn').on('click',function(){
        console.log($('#mode').val());
        $.ajax({
            url: "/test_submit/",
            type: "POST",
            data:{  'subject_id':$('#subjectList').val(),
                    'test_type':$('#testTypeList').val(),
                    'test_id':$('#testIDList').val(),
                    'test_name':$('#testName').val(),
                    'test_total_questions':$('#testTotalQues').val(),
                    'total_marks':$('#totalMarks').val(),
                    'total_time':$('#totalTime').val(),
                    'mode':$('#mode').val(),
                    'csrfmiddlewaretoken' : $("input[name=csrfmiddlewaretoken]").val()},
            dataType:"JSON",
            success: function(response) {
                if(response.status==1){
                    swal("Success!", "Successfully Updated!", "success");
                    enable();
                    $("#testSectionForm")[0].reset();
                    $("#quesNo").text('');
                }
                else if(response.status==2){
                    swal("Success!", "Successfully Inserted!", "success");
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }
            }
        });
    });
    $('#resetBtn').on('click',function(){
        enable();
        $("#totalMarks").prop('disabled',true);
    });
    function enable() {
        $('input:disabled, select:disabled').each(function () {
           $(this).removeAttr('disabled');
        });
    }
});