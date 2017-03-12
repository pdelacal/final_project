$(document).on('turbolinks:load', function() {
  $('.glyphicon-chevron-left').on('click', function() {
    if($('.photo-slide-1').hasClass('active')) {
      $('.photo-slide-1').removeClass('active');
  	  $('.photo-slide-3').addClass('active');
    } else if($('.photo-slide-3').hasClass('active')) {
      $('.photo-slide-3').removeClass('active');
  	  $('.photo-slide-2').addClass('active');
    } else if ($('.photo-slide-2').hasClass('active')) {
      $('.photo-slide-2').removeClass('active');
    	$('.photo-slide-1').addClass('active');
    }
  });

  $('.glyphicon-chevron-right').on('click', function() {
    if($('.photo-slide-1').hasClass('active')) {
      $('.photo-slide-1').removeClass('active');
      $('.photo-slide-2').addClass('active');
    } else if($('.photo-slide-3').hasClass('active')) {
      $('.photo-slide-3').removeClass('active');
      $('.photo-slide-1').addClass('active');
    } else if ($('.photo-slide-2').hasClass('active')) {
      $('.photo-slide-2').removeClass('active');
      $('.photo-slide-3').addClass('active');
    }
  });
});
