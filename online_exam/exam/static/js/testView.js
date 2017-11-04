$(document).ready(function(){
    $('#testLink').on('click',function(){
        $.ajax({
            url: "/test/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                console.log(response)
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
                }
            }
        });
    });
});