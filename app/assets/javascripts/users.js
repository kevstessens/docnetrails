$(document).ready(function() {
    var user_type = $("#user_user_role_id");

    if (user_type.val() == "2") {
        $("#hours_to_hide").show();
    } else {
        $("#hours_to_hide").hide();

    }

    user_type.change(function() {
        if (user_type.val() != "2") {
            $("#hours_to_hide").hide();
        } else {
            $("#hours_to_hide").show();

        }
    });
})
