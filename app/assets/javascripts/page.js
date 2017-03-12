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
  var showPopup2 = false;
  $('#loginpopup').on('hidden.bs.modal', function () {
      if (showPopup2) {
          $('#signuppopup').modal('show');
          showPopup2 = false;
      }
  });

  $("#signuppopup").click(function() {
      $('#loginpopup').modal('hide');
      showPopup2 = true;
  });
  // $('#signuppopup').click(function(e) {
  //   e.preventDefault();
  // });
});

// $(document).on('turbolinks:load', function() {
//   $('.register_button').click(function(e) {
//     $.ajax({
//       url: "/register",
//       type: 'POST'
//     });
//   });
// });
