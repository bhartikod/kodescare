$(document).ready(function () {
  $('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    responsive: {
      0: {
        items: 1
      },
      400: {
        items: 1
      },
      700: {
        items: 2
      },
      1000: {
        items: 3
      }
    }
  })

  var sticky_navigation_offset_top = $('.sticky_navigation').offset().top;
  var sticky_navigation = function () {
    var scroll_top = $(window).scrollTop();
    if (scroll_top > sticky_navigation_offset_top) {
      $('.sticky_navigation').addClass("headerfixed");
      $('.sticky_navigation').removeClass("headerrelative");

    } else {
      $('.sticky_navigation').removeClass("headerfixed");
      $('.sticky_navigation').addClass("headerrelative");
    }
  };
  sticky_navigation();
  $(window).scroll(function () {
    sticky_navigation();
  });

});
/*navbar fixed on page scroll js close here*/


/*owl carousel js close here*/