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
$(document).ready(function () {
    hljs.initHighlightingOnLoad();
});
$(function() {
  $('#header .toggle').click(function () {
    $(this).toggleClass('active');
  });
});
$(function() {
  $('#main .sidebar a.active').click(function () {
    $('#main .sidebar').toggleClass('active');
    return false;
  });

  $('#main .sidebar .cancel').click(function () {
    $('#main .sidebar').removeClass('active');
  });
});
$(function() {
  $('.lang-snippet').each(function () {
    var that = this;
    var header = $(this).parent().prev('h4');
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