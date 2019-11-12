$(function() {
  $(document).on('turbolinks:load', function() { 
    $('#dlt_btn').on('click', function(){
      var left_positon = ($("body").width()/2)-($(".popup").width()/2)
      $("body").css("overflow", "hidden");
      $( "#gray_panel" ).fadeIn("slow");
      $( ".popup" )
      .css("z-index","51")
      .css("position", "fixed")
      .css("top", 25)
      .css("left", left_positon)
      .fadeIn(600);
      $(document).on("click", ".popup__btn--cancel", function () {
        $( "#gray_panel" ).fadeOut("slow");
        $( ".popup" ).fadeOut("slow");
        $("body").css("overflow", "scroll");
      });
    });
  });
});