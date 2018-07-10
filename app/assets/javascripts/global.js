$(function(){
  var track = $('#jquery_jplayer_1').attr('data-track');

  $('#jquery_jplayer_1').jPlayer({
    ready: function(){
      $(this).jPlayer('setMedia', {
        mp3: track
      });
    },
    volume: 1,
    swfPath: '/assets'
  });

  $('.photos').magnificPopup({
    delegate: '.photo a',
    type: 'image',
    tLoading: 'Loading image #%curr%...',
    mainClass: 'mfp-img-mobile',
    gallery: {
      enabled: true,
      navigateByImgClick: true,
      preload: [0,1] // Will preload 0 - before current, and 1 after the current image
    }
  });

  $('.header--control').on('click', function(e){
    $('nav').toggleClass('open');
  });
});
