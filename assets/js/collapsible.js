$(document).ready(function () {
	// Make nested lists collapsible
	$('#sidebar h3').click(function () {
		var container = $(this).parent();
		if (container.hasClass('active')) container.removeClass('active');
		else { container.addClass('active'); }
	});

    // Expand link to current page
	var pathname = window.location.pathname;
	console.log();
});
