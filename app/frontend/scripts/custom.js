$(document).ready(function() {
    $('#event_datetime').datepicker({
        minDate: new Date()
    });
    $('#submitButton').attr('disabled',true);
    $('#photo').change(function() {
        if ($(this).val().length != 0)
            $('#submitButton').attr('disabled',false);
        else
            $('#submitButton').attr('disabled',true);
    })
});
