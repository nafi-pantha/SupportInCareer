$(document).ready(function(){
    $('#reviewLink').on('click',function(){
        $.ajax({
            url: "/reviewUserList/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                $("#reviewUser").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response,function(index,row){
                        $.each(row, function(k, v){
                            $("#reviewUser")
                            .append(
                                $("<option></option>")
                                    .text(v.user_id+': '+v.user__user__username)
                                    .val(v.user_id)
                            );
                        });
                    });
                }
            }
        });
    });
    $('#reviewUser').on('change',function(){
        $.ajax({
            url: "/getTestListReview/",
            type: "GET",
            data: {'user_id':$(this).val()},
            dataType:"JSON",
            success: function(response) {
                $("#reviewTest").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response,function(index,row){
                        $.each(row, function(k, v){
                            $("#reviewTest")
                            .append(
                                $("<option></option>")
                                    .text(v.test_id.toString().substring(3, 5)+': '+v.test_id__test_name)
                                    .val(v.test_id)
                            );
                        });
                    });
                }
            }
        });
    });

    $('#reviewTest').on('change',function(){
        $.ajax({
            url: "/getUserAnswerReview/",
            type: "GET",
            data: {'user_id':$('#reviewUser').val(),
                   'test_id':$('#reviewTest').val()},
            dataType:"JSON",
            success: function(response) {
                if(response){
                    $("#reviewAnsTbl").find('tr').not(':first').remove();
                    var trHTML = '';
                    $.each(response,function(index,row){
                        $.each(row, function (key,value) {
                            trHTML+= '<tr id='+value.essay_question_id+'>'+
                            '<td><span>'+value.essay_question_id+'</span><input type="text" class="form-control hidden" id="quesid" name="quesid" value="'+value.essay_question_id+'"></td>'+
                            '<td>'+value.essay_question_id__essay_question+'</td>'+
                            '<td>'+value.user_answer+'</td>'+
                            '<td><input type="text" class="form-control reviewMark" name="mark"></td>'+
                            '<td><input type="text" class="form-control" name="suggestions"></td></tr>';
                        });
                    });
                    $('#reviewAnsTbl').append(trHTML);
                }
            }
        });
    });

    sum=0;
    $(document).on("blur", ".reviewMark", function(){
        /*sum=sum+parseInt($(this).val());
        $('#reviewTotalMarks').val(sum);*/
        var sum = 0;
        $('.reviewMark').each(function() {
            sum += Number($(this).val());
        });
        $('#reviewTotalMarks').val(sum);
    });

    $('#reviewSubmitBtn').on('click',function(){
        var data=[];
        $('#reviewAnsTbl').find('tr:not(:has(th))').each(function(){
            var id=$(this).attr('id');
            var row={};
            $(this).find('input').each(function(){
                row[$(this).attr('name')]=$(this).val();
            });
            data.push(row);
        });
        console.log(data);
        $.ajax({
            url: "/review_submit/",
            type: "POST",
            data: {obj:JSON.stringify(data),
            'csrfmiddlewaretoken' : $("input[name=csrfmiddlewaretoken]").val(),
            'test_id':$('#reviewTest').val(),
            'user_id':$('#reviewUser').val(),
            'total_marks':$('#reviewTotalMarks').val()},
            dataType:"JSON",
            success: function(response) {
                console.log(response.status);
                if(response.status=='1'){
                    swal("Success!", "Successfully Updated!", "success");
                }
                else{
                    swal("Error!", "Something Wrong!", "error");
                }
            }
        });
    });
});