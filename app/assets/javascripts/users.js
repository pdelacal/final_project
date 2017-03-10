$(document).on('turbolinks:load', function() {
  $('button').click(function() {
    if($('.questionnaire:visible').length==0) {
      $('.questionnaire').slideDown();
    } else {
      $('.questionnaire').slideUp();
    }
  });
});
