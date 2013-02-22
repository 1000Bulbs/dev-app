var fb = {
    init: function() {
        $("#submit-btn").click(function() {
            $.ajax({
                url: "../fb.php",
                type: "GET",
                dataType: "html",
                success: function(data) {
                    $("#display").html(data);
                },
                error: function (e) {
                    if (console != null) {
                        console.log('A server error occurred.');
                    }
                }
            });
        });
    }
};

$(document).ready(function() {
    fb.init();
});
