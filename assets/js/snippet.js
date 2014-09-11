$(function() {
  $('.lang-snippet').each(function () {
    var that = this;
    var header = $(this).parent().prev('h3');
    var label = header.html();
    $(this).hide();
    header.addClass('snippet-header').html('Show <strong>'+ label +'</strong>');
    header.click(function () {
      $(that).toggle(100);
      if ($(this).hasClass('expanded')) {
        $(this).removeClass('expanded');
        $(this).html('Show <strong>'+ label +'</strong>');
      }
      else {
        $(this).addClass('expanded');
        $(this).html('Hide <strong>'+ label +'</strong>');
      }
    });
  });
});