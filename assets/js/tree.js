$(function() {
  $('#configuration .content ul').each(function () {
    var expand = $('<button class="more"><span>Expand</span></button>')
    var that = this;
    expand.click(function () {
      $(that).toggle(100);
      if ($(this).hasClass('expanded')) {
        $(this).removeClass('expanded');
        $(this).html('<span>Expand</span>');
      }
      else {
        $(this).addClass('expanded');
        $(this).html('<span>Collapse</span>');
      }
    });
    $(that).hide();
    $(that).before(expand);
  });
});