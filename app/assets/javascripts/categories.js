// $(document).on('turbolinks:load',function(){
  
  // $('.l').mouseover(function(){
  //   $(this).css("color","#FF0000");
  // }).mouseout(function(){
  //     $("p").css("color","");
  //     console.log(this);   
  //   })   
  // });

  // $(document).on('turbolinks:load', function() {
  //   console.log("It works on each visit!")
  // })

  // $(function(){
  //   $("#header-nav__parent__root").mouseover(function(){
  //     $(this).siblings().find("li.header-nav__child__detail").hide();
  //     $(this).children().slideToggle(150);     // 自分のサブメニューを表示する。
  //     console.log(this);
  //     })
  //   })

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
      console.log(this);
      },function(){
      $('ul.header-nav__child').slideUp(150);
      });
  })



    





//   $(function(){
//     $('.js-menu__item__link').each(function(){
//         $(this).on('click',function(){
//             $("+.submenu",this).slideToggle();
//             return false;
//         });
//     });
// });



      // $("li.header-nav__parent__detail").mouseleave(function(){
      // slideUp(150);
      // })


      // $(function(){
      //   $('.js-menu__item__link').each(function(){
      //       $(this).on('click',function(){
      //           $(this).toggleClass('on');
      //           $("+.submenu",this).slideToggle()
      //           return false;
      //       });


  // .mouseout(function(){
  //   $(this).css("color","");
  // });


  


  // $('#category__link').children().hover(function(){
  // $(this).children().stop().slideToggle(100);
  // });
  // })

  //  $(function(){
  //     // ▼マウスが載ったらサブメニューを表示
  //     $('#category-link').mouseenter(function(){
  //        $(this).siblings().find("ul").hide();  // 兄弟要素に含まれるサブメニューを全部消す。
  //        $(this).children().slideDown(150);     // 自分のサブメニューを表示する。
  //     });
      // ▼どこかがクリックされたらサブメニューを消す
      // $('html').click(function() {
      //    $('header-nav').slideUp(150);
      // });
  