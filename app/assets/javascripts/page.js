$(document).on('turbolinks:load', function() {
  $('.login_email').click(function(e) {
    e.preventDefault();

    if ($('.tab-pane2:visible').length == 0) {
      $('.tab-pane2').slideDown();
    } else {
      $('.tab-pane2').slideUp();
    }
  });

  $('.signup_email').click(function(e) {
    e.preventDefault();

    if ($('.tab-pane1:visible').length == 0) {
      // $('.tab-pane').html("<%= j render 'users/form', user: @user %>")
      $('.tab-pane1').slideDown();
    } else {
      $('.tab-pane1').slideUp();
    }
  });

  // var showPopup2 = false;
  // $('#loginpopup').on('hidden.bs.modal', function (e) {
  //     if (showPopup2) {
  //         $('#signuppopup').modal('show');
  //         showPopup2 = false;
  //     }
  // });

  $("#signuppopup").click(function(e) {
      e.preventDefault();
      $('#myModal').modal('hide');
      $('#signup').modal('show');
    });
  // $('#signuppopup').click(function(e) {
  //   e.preventDefault();
  // });
  $("#loginpopup").click(function(e) {
      e.preventDefault();
      $('#signup').modal('hide');
      $('#myModal').modal('show');
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
