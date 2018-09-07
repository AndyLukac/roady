import "bootstrap";
import "./image";

$("document").ready(function(){
  $(".tab-slider--body").hide();
  $(".tab-slider--body:first").show();
});


$("#map").on('click', ".tab-slider--trigger", function() {
  $(".tab-slider--body").hide();
  var activeTab = $(this).attr("rel");

  $("#"+activeTab).fadeIn();

  if (this.nextElementSibling == null) {
    $('.tab-slider--tabs').addClass('slide');
  } else {
    $('.tab-slider--tabs').removeClass('slide');
  }
  $(".tab-slider--nav li").removeClass("active");
  $(this).addClass("active");
});

