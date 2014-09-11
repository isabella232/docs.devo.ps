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