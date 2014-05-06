$(document).ready(function () {
	$('#sidebar h3').click(function () {
		var container = $(this).parent();
		if (container.hasClass('active')) container.removeClass('active');
		else { container.addClass('active'); }
	});
});