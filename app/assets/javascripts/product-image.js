$(document).on('turbolinks:load',function(){
  $(document).ready(function(){
    $('.item__main-content__photo__frame__stage-outer__stage li:eq(0)').css("left","0px");
    $('.item__main-content__photo__frame__stage-outer__stage li:eq(1)').css("left","300px");
    $('.item__main-content__photo__frame__stage-outer__stage li:eq(2)').css("left","600px");
    $('.item__main-content__photo__frame__stage-outer__stage li:eq(3)').css("left","900px");
    $('.item__main-content__photo__frame__stage-outer__stage li:eq(4)').css("left","1200px");
  });
  
  $(document).on("mouseenter", ".item__main-content__photo__frame__dots__dot:eq(0)",function () {
    $('.item__main-content__photo__frame__stage-outer__stage').animate({"left": "0px"});
  });
  $(document).on("mouseenter",".item__main-content__photo__frame__dots__dot:eq(1)",function () {
    $('.item__main-content__photo__frame__stage-outer__stage').animate({"left":"-300px"});
  });
  $(document).on("mouseenter",'.item__main-content__photo__frame__dots__dot:eq(2)',function(){
    $('.item__main-content__photo__frame__stage-outer__stage').animate({"left":"-600px"});
  });
  $(document).on("mouseover",'.item__main-content__photo__frame__dots__dot:eq(3)',function(){
    $('.item__main-content__photo__frame__stage-outer__stage').animate({"left":"-900px"});
  });
  $(document).on("mouseover",'.item__main-content__photo__frame__dots__dot:eq(4)',function(){
    $('.item__main-content__photo__frame__stage-outer__stage').animate({"left":"-1200px"});
  });
});




