$(function(){
  $("h2#header-nav__parent__root").hover(function(){
    $(this).find("ul.header-nav__child").hide();
    $(this).children().slideDown(150); 
      },function(){
      $('ul.header-nav__parent').slideUp(150);
      });
})

$(function(){
  $("li.header-nav__parent__detail").hover(function(){
    $(this).find("ul.header-nav__grand-child").hide();
    $(this).children().slideDown(150);     
      },function(){
      $('ul.header-nav__child').slideUp(150);
      });
})