$(document).ready(function () {
	$('#header').click(function () {
		if ($(this).attr('class') != 'logo') {
			if ($('body').hasClass('dropdown')) $('body').removeClass('dropdown');
			else $('body').addClass('dropdown');
		}
		return false;
	});
});

$(document).keyup(function(e) {
    if (e.keyCode == 27) {
        $('body').removeClass('dropdown');
    }
});