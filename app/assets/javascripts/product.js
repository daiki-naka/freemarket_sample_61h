$(document).on('turbolinks:load',function(){
  //contents_header自動スライド
  var page=0;
  var lastPage =parseInt($(".contents__header img").length-1);
  $(".contents__header img").css("display","none");
  $(".contents__header img").eq(page).css("display","block");

  function changePage(){
    $(".contents__header img").fadeOut(1000);
    $(".contents__header img").eq(page).fadeIn(1000);
};

var Timer;
function startTimer(){
  Timer = setInterval(function(){
    if(page === lastPage){
      page = 0;
      changePage();
    }
    else{
      page ++;
      changePage();
    };
  }, 5000);
}

startTimer();

});
