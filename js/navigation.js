$(function() {
  $('#main .sidebar a.active').click(function () {
    $('#main .sidebar').toggleClass('active');
    return false;
  });

  $('#main .sidebar .cancel').click(function () {
    $('#main .sidebar').removeClass('active');
  });
});