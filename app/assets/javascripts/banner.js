$(document).on('turbolinks:load', function(){
  $(function(){
    $('#slide').slick({
      centerMode: true,
      centerPadding: '50px',
      autoplay: true,
      autoplaySpeed: 4000,
      dots: true,
      dotsClass: 'slide-dots',
      arrows: false
    });
  })
});