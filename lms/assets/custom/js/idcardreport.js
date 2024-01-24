(function($) { 
	"use strict";

    $(document).ready(function() {
        $('#roleID').on('change', function() {
            var roleID = $('#roleID').val();
            $.ajax({
                type: "POST",
                url: THEME_BASE_URL + 'idcardreport/get_member',
                data: {'roleID': roleID},
                dataType: 'html',
                success: function(data) {
                    $('#memberID').html(data);
                }
            });
        });

        $('#roleID, #memberID, #type').on('change', function() {
            $('.divhide').hide();
        });
    });

})(jQuery);