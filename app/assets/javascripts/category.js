$(function(){
  $(document).on('turbolinks:load', function() { 
  
    $(document).on('mouseover', '.header-inner__bottom__search--categories', function(){
      $('#parents').css('visibility', 'visible');
      $('#parents').css('pointer-events', 'auto');
    });

    $(document).on('mouseout', '.header-inner__bottom__search--categories', function(){
      $('#parents').css('visibility', 'hidden');
      $('#parents').css('pointer-events', 'none');
    });

    $(document).on('mouseleave', '#parents', function(){
      $('#parents').css('visibility', 'hidden');
      $('#parents').css('pointer-events', 'none');
      $("ul#parents li.selected").removeClass("selected");
    });


    $("ul#parents li").hover(function(){
      $("ul#parents li.selected").removeClass("selected");
      $(this).addClass("selected");
    });

    $(document).on('mouseover', '.child', function(){
      $(".child.selected").removeClass("selected");
      $(this).addClass("selected");
    });

    $(document).on('mouseover', '.grand_child', function(){
      $(".grand_child.selected").removeClass("selected");
      $(this).addClass("selected");
    });

    $(document).on('mouseover', '.parent', function(){
      var parentId = $(this).children('a').data('category-id');
      if (!isNaN(parentId)){
        $('#children').css('width', '220px');
        $.ajax({
          url: "../../products/header_category",
          type: 'GET',
          data: { category_id: parentId },
          dataType: 'json'
        })
        .done(function(child){
          $('#children').empty();
          $(child).each(function(index, element) {
            var cHtml = `<li class="child">
                          <a class="child--text" data-category-id="${element.id}" href="/categories/${element.id}">${element.name}</a>
                        </li>`;
            $('#children').append(cHtml);
          })
          $('#children').append(`<ul id="grand_children"></ul>`);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      } else{
        $('#children').css('width', '0');
        $('#children').empty();
      }
    });

    $(document).on('mouseover', '.child', function(){
      var childId = $(this).children('a').data('category-id')
      if (!isNaN(childId)){
        $.ajax({
          url: "../../products/header_category",
          type: 'GET',
          data: { category_id: childId },
          dataType: 'json'
        })
        .done(function(grand_child){
          var num = 0;
          $('#grand_children').empty();
          $(grand_child).each(function(index, element) {
            if (num != 23){
              var gHtml =`<li class="grand_child">
                            <a class="grand_child--text" data-category-id="${element.id}" href="/categories/${element.id}">${element.name}</a>
                          </li>`;
              $('#grand_children').append(gHtml);
              num += 1;
            } else {
              return false;
            }
          });
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      } else{
        $('#grand_children').empty();
      }
    });

    $('.contents__middle__category__names__list').click(function() {
      var speed = 400; 
      var href= $(this).attr("href");
      var target = $(href == "#" || href == "" ? 'html' : href);
      var position = target.offset().top;
      $('body,html').animate({scrollTop:position}, speed, 'swing');
      return false;
  });

  });
});