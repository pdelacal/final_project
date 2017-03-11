$(document).on('turbolinks:load', function() {
  $('button').click(function() {
    if($('.questionnaire:visible').length==0) {
      $('.questionnaire').slideDown();
    } else {
      $('.questionnaire').slideUp();
    }
  });

  // $(".profile_picture").hover(
  //   function(){
  //     $('.avatar_btn').css({"display": "inline-flex", "position": "absolute", "top": "36rem", "left": "10rem"});
  //   },
  //   function() {
  //     $('.avatar_btn').css({"display": "none"});
  //   }
  // );
});
