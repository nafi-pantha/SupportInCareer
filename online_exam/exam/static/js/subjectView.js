$(document).ready(function(){
    $('#subjectLink').on('click',function(){
        allSubjectListOnTbl();
        getTotalQuesNo();
    });

    $('#subjectEditTbl').on('click','tr', function(){
        $('#subjectID').val($(this).attr("data-id"));
        $('#subjectName').val($(this).attr("data-subName"));
        $('#mcqTotalTest').val($(this).attr("data-mcq_total_test"));
        $('#essayTotalTest').val($(this).attr("data-essay_total_test"));
    });

    $("#subjectSectionForm").validate({
        onkeyup: false,
        rules: {
            subjectID:{
                required: false,
            },
            subjectName:{
                required: true,
                minlength: 3,
                remote: "/subjectname_Check/"
            },
            mcqTotalTest: {
                required: true
            },
            essayTotalTest: {
                required: true
            }
        },submitHandler: function(form) {
            $.ajax({
                type: $(form).attr('method'),
                url: /subject_insert/,
                data: $(form).serialize(),
                success: function(response) {
                    if(response.status=='1'){
                        swal("Success!", "Successfully Added!", "success");
                        allSubjectListOnTbl();
                        resetSection();
                    }
                    else if(response.status=='2'){
                        swal("Success!", "Successfully Updated!", "success");
                        allSubjectListOnTbl();
                        resetSection();
                    }
                    else{
                        swal("Error!", "Something Wrong!", "error");
                    }
                }
            });
        }
    });

    $('#subjectReset').on('click',function(){
        var validator = $( "#subjectSectionForm" ).validate();
        validator.resetForm();
        $(":input").closest('.form-group').removeClass('has-success');
    });

    function allSubjectListOnTbl(){
        $.ajax({
            url: "/test/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                if(response){
                    $("#subjectEditTbl").find('tr').not(':first').remove();
                    var trHTML = '';
                    $.each(response.results,function(index,row){
                        //$.each(row, function(key, value){
                            trHTML +='<tr data-id="'+row.subject_id+'" data-subName="'+row.subject_name+'" data-mcq_total_test="'+row.mcq_total_test+'" data-essay_total_test="'+row.essay_total_test+'">'+
                        '<td data-id="'+row.subject_id+'">' + row.subject_id +'</td>'+
                        '<td>' + row.subject_name +'</td>'+
                        '<td>' + row.mcq_total_test +'</td>'+
                        '<td>' + row.essay_total_test +'</td>';
                        //});
                    });
                    $('#subjectEditTbl').append(trHTML);
                }
            }
        });
    }

    function resetSection(){
        $("input[type=text]").val("");
        $("select").prop('selectedIndex',0);
        $(":input").closest('.form-group').removeClass('has-success');
    }

    function getTotalQuesNo(){
        $.ajax({
            url: "/total_ques_no/",
            type: "GET",
            dataType:"JSON",
            success: function(response) {
                $("#mcqTotalTest").find('option').not(':first').remove();
                if(response.length!=0){
                    $.each(response.mcqResults,function(index,row){
                        $("#mcqTotalTest")
                        .append(
                            $("<option></option>")
                                .text(row.mcq_total_test)
                                .val(row.mcq_total_test)
                        );
                    });
                    $("#essayTotalTest").find('option').not(':first').remove();
                    $.each(response.essayResults,function(index,row){
                        $("#essayTotalTest")
                        .append(
                            $("<option></option>")
                                .text(row.essay_total_test)
                                .val(row.essay_total_test)
                        );
                    });
                }
            }
        });
    }


});
