$(document).ready(function() {

    $("#feature_for_new_ticket").click(function(){
        $("#main_selector").val("Feature");
    });

    $("#bug_for_new_ticket").click(function(){
        $("#main_selector").val("Bug");
    });  

    $("#feature_for_popup").click(function(){
        $("#popup_selector").val("Feature");
    }); 

    $("#bug_for_popup").click(function(){
        $("#popup_selector").val("Bug");
    });

    $(document).on("click", "#assign", function () {
        var myId = $(this).data('id');
        $(".modal-body #bug_id").val( myId );
        $('#myModalAssign').modal('show');
    });

    $(document).on("click", "#state", function () {
        var myId = $(this).data('id');
        $(".modal-body #ticket_id").val( myId );
        $('#myModalState').modal('show');
    });

});