$(document).on('turbolinks:load', function() {
  $('.login').click(function(e) {
    e.preventDefault();

    if ($('.tab-pane:visible').length == 0) {
      $('.tab-pane').slideDown();
    } else {
      $('.tab-pane').slideUp();
    }
  });
});


$(document).on('turbolinks:load', function() {
  $('.register').click(function(e) {
    e.preventDefault();

    if ($('.tab-pane:visible').length == 0) {
      $('.tab-pane').slideDown();
    } else {
      $('.tab-pane').slideUp();
    }
  });
});
