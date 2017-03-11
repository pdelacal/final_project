$(document).on('turbolinks:load', function() {
  $('.login_email').click(function(e) {
    e.preventDefault();

    if ($('.tab-pane:visible').length == 0) {
      $('.tab-pane').slideDown();
    } else {
      $('.tab-pane').slideUp();
    }
  });

  $('.signup_email').click(function(e) {
    e.preventDefault();

    if ($('.tab-pane:visible').length == 0) {
      // $('.tab-pane').html("<%= j render 'users/form', user: @user %>")
      $('.tab-pane').slideDown();
    } else {
      $('.tab-pane').slideUp();
    }
  });
});

// $(document).on('turbolinks:load', function() {
//   $('.register_button').click(function(e) {
//     $.ajax({
//       url: "/register",
//       type: 'POST'
//     });
//   });
// });
