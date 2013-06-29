// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery_ujs
//= require jquery_nested_form
//= require users.js
//= require best_in_place


$(function() {
    $('.datepicker-input').datepicker({
        dateFormat: "dd/mm/yy"
    });
});

$(function() {
    $('form').live('nested:fieldAdded', function(event) {
        $(event.field).find('.datepicker-input').removeClass('hasDatepicker').datepicker({
            dateFormat: "dd/mm/yy"
        });
    });
});

$(document).ready(function() {

    jQuery(".best_in_place").best_in_place();
    $('.best_in_place').bind('ajax:success', function(){
        if ($(this).attr('data-type') == 'textarea')
            $(this).JQtextile('textile', this.innerHTML)
    });

    $('.highlight_on_success').bind("ajax:success", function(){
        $(this).closest('tr').effect('highlight')
    });

    $("#notification_icon").click(function(){
        $("#sResults").toggle();
        jQuery.get("/notifications/mark_as_read")
    });

    $('body').click(function() {
        $('#sResults').fadeOut();
    });

    $('#notification_icon').click(function(e) {
        e.stopPropagation();
    });

    $("#sResults").hide();


    $('[id^="fpencil_"]').hide();
    $('[id^="rpencil_"]').hide();


    $('[id^="feature_"]').each(function() {
        var newid = this.id.replace(/feature/, "fpencil");
        $(this).hover(
            function() { $("#" + newid).fadeIn(); },
            function() { $("#" + newid).fadeOut(); }
        );

        $(this).click(function() {
            $("#" + newid).hide();
            $(this).hover(
                function() { $("#" + newid).hide(); },
                function() { $("#" + newid).hide(); }
            );

        });
    });

    $('[id^="responsible_"]').each(function() {
        var newid = this.id.replace(/responsible/, "rpencil");
        $(this).hover(
            function() { $("#" + newid).fadeIn(); },
            function() { $("#" + newid).fadeOut(); }
        );

        $(this).click(function() {
            $("#" + newid).hide();
            $(this).hover(
                function() { $("#" + newid).hide(); },
                function() { $("#" + newid).hide(); }
            );

        });
    });

    $('[id^="changer_"]').each(function() {
        var newid = this.id.replace(/changer_/, "");
        $(this).click(function(){
            $("#project_id").val(newid);
            $("#change_project_button").click();
        });
    });

});






