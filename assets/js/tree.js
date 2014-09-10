$(function() {
  $('#configuration .content ul').each(function () {
    var expand = $('<button class="more"><span>Expand</span></button>')
    var that = this;
    expand.click(function () {
      $(that).toggle(100);
      ($(this).hasClass('expanded')) ? $(this).removeClass('expanded') : $(this).addClass('expanded');
    });
    $(that).hide();
    $(that).before(expand);
  });
});