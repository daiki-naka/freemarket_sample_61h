$(function(){
  $("h2#header-nav__parent__root").hover(function(){
    $(this).siblings().find("ul.header-nav__child").hide();
    $(this).children().slideDown(150);     // 自分のサブメニューを表示する。
    },function(){
    $('ul.header-nav__parent').slideUp(150);
    });
  })

$(function(){
  $("ul.header-nav__parent").hover(function(){
    $(this).siblings().find("ul.header-nav__grand-child").hide();
    $(this).children().slideDown(150);     // 自分のサブメニューを表示する。
    },function(){
    $('ul.header-nav__child').slideUp(150);
    });
})