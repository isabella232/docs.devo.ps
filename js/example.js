$(function() {
  $('#examples + ul, #example + ul').each(function () {
    var that = this;
    var tabs = $('<div class="tabs"></div>');
    $(this).addClass('tabbed');
    $(this).before(tabs);
    $('li', this).each(function () {
      var tab = $(this).children('h3').html();
      var content = this;
      $(this).children('h3').click(function () {
        $('.active', that).removeClass('active');
        $('.active', tabs).removeClass('active');
        $(this).addClass('active');
        $(content).addClass('active');
      });
      tabs.append($(this).children('h3'));
    });
    $('h3:first-child', tabs).trigger('click');
  });
});