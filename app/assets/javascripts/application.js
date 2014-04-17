// javascript manifest
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require retina
//= require jquery.easing.1.3
//= require_self

$(function() {
  $('a.smoothScroll').click(function() {
    $('html, body').animate({
      scrollTop: $(this.hash).position().top
    }, 1000);
    return false;
  });
});