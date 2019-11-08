$(function(){
  var preWord = "";
  function appendSelect(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  //子カテゴリフォーム
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='select-box'>
                        <i class='fa fa-angle-down fa-2x icon-deco'></i>
                          <select class="select-box--menu choosing" id="child_category" >
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>           
                        </div>
                      </div>`;
    $('.exhibit-product__detail__box--form').append(childSelectHtml);
  }
  //孫カテゴリフォーム
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_box'>
                              <div class='select-box'>
                                <i class='fa fa-angle-down fa-2x icon-deco'></i>
                                <select class="select-box--menu choosing" id="grandchild_category" name="product[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.exhibit-product__detail__box--form').append(grandchildSelectHtml);
  }
  //服サイズフォーム
  function appendClothesizeBox(){
    var sizefomeHtml = '';
    sizefomeHtml = `<div class= 'sizeform-box margin-top-40' id= 'size_box'>
                      <label>サイズ
                        <span class="require">必須
                        </span>
                      </label>
                      <div class='select-box margin-top-40'>
                        <i class='fa fa-angle-down fa-2x icon-deco'></i>
                        <select class="select-box--menu choosing" id="size" name="product[product_size]">
                          <option value="---">---</option>
                          <option value="XXL以下">XXL以下</option>
                          <option value="XS(SS)">XS(SS)</option>
                          <option value="S">S</option>
                          <option value="M">M</option>
                          <option value="L">L</option>
                          <option value="XL(LL)">XL(LL)</option>
                          <option value="2XL(3L)">2XL(3L)</option>
                          <option value="3XL(4L)">3XL(4L)</option>
                          <option value="4XL(5L以上)">4XL(5L以上)</option>
                          <option value="FREE SIZE">FREE SIZE</option>
                        </select>
                      </div>
                      <div class ='margin-top-40 width-92'>
                        <label>ブランド
                          <span class="any">任意
                          </span>
                        </label>
                        <div class='select-box'>            
                          <input type="hidden" value="" id="input_brand" name="product[brand_id]">
                          <input class="select-box--menu choosing" value="" placeholder="例）シャネル"  id="brands-search-form">
                          <div id="brands-search-result">
                          </div>
                        </div>
                      </div>
                    </div>`;
    $('.exhibit-product__detail__box--form').append(sizefomeHtml);
  }
  //靴サイズフォーム
  function appendShoessizeBox(){
    var sizefomeHtml = '';
    sizefomeHtml = `<div class= 'sizeform-box margin-top-40' id= 'size_box'>
                      <label>サイズ
                        <span class="require">必須
                        </span>
                      </label>
                      <div class='select-box'>
                        <i class='fa fa-angle-down fa-2x icon-deco'></i>
                        <select class="select-box--menu choosing" id="size" name="product[product_size]">
                          <option value="---">---</option>
                          <option value="23.5cm以下">23.5cm以下</option>
                          <option value="24.0cm">24.0cm</option>
                          <option value="24.5cm">24.5cm</option>
                          <option value="25.0cm">25.0cm</option>
                          <option value="25.0cm">25.0cm</option>
                          <option value="25.5cm">25.5cm</option>
                          <option value="26.0cm">26.0cm</option>
                          <option value="26.5cm">26.5cm</option>
                          <option value="27.0cm">27.0cm</option>
                          <option value="27.5cm">27.5cm</option>
                          <option value="28.0cm">28.0cm</option>
                          <option value="28.5cm">28.5cm</option>
                          <option value="29.0cm">29.0cm</option>
                          <option value="29.5cm以上">29.5cm以上</option>
                        </select>
                      </div>
                      <div class ='margin-top-40 width-92'>
                        <label>ブランド
                          <span class="any">任意
                          </span>
                        </label>
                        <div class='select-box'>
                          <input type="hidden" value="" id="input_brand" name="product[brand_id]">
                          <input class="select-box--menu choosing" value="" placeholder="例）シャネル"  id="brands-search-form">
                          <div id="brands-search-result">
                          </div>
                        </div>
                      </div>
                    </div>`;
    $('.exhibit-product__detail__box--form').append(sizefomeHtml);
  }
  //ブランドフォーム
  function appendBrandsizeBox(){
    var sizefomeHtml = '';
    sizefomeHtml = `<div class= 'sizeform-box margin-top-40 width-92' id= 'size_box'>
                      <label>ブランド
                        <span class="any">任意
                        </span>
                      </label>
                      <div class='select-box'>
                        <input type="hidden" value="" id="input_brand" name="product[brand_id]">
                        <input class="select-box--menu choosing" value="" placeholder="例）シャネル"  id="brands-search-form">
                        <div id="brands-search-result">
                        </div>
                      </div>
                    </div>`;
    $('.exhibit-product__detail__box--form').append(sizefomeHtml);
  }
  //ブランド検索
  function appendBrand(brand) {
    var html = `<div class="brand-form" id="brand" data-brand-id="${brand.id}" data-brand-name="${brand.name}">${brand.name}</div>`
    $("#brands-search-result").append(html);
  }
  //配送方法（出品者負担）
  function appendMethod_1(method) {
    var method = `<div class= 'sizeform-box margin-top-40' id= 'method_box'>
                    <label>配送の方法
                      <span class="require">必須
                      </span>
                    </label>
                    <div class='select-box'>
                      <i class='fa fa-angle-down fa-2x icon-deco'></i>
                      <select class="select-box--menu choosing" name="product[d_method]">
                        <option value="---">---</option>
                        <option value="未定">未定</option>
                        <option value="らくらくメルカリ">らくらくメルカリ</option>
                        <option value="ゆうメール">ゆうメール</option>
                        <option value="レターパック">レターパック</option>
                        <option value="普通郵便(定形, 定形外)">普通郵便(定形, 定形外)</option>
                        <option value="クロネコヤマト">クロネコヤマト</option>
                        <option value="ゆうパック">ゆうパック</option>
                        <option value="クリックポスト">クリックポスト</option>
                        <option value="ゆうパケット">ゆうパケット</option>
                      </select>
                    </div>
                  </div>`
    $(".exhibit-product__delivery__box__delivery").append(method);
  }
  //配送方法（購入者負担）
  function appendMethod_2(method) {
    var method = `<div class= 'sizeform-box margin-top-40' id= 'method_box'>
                    <label>配送の方法
                      <span class="require">必須
                      </span>
                    </label>
                    <div class='select-box'>
                      <i class='fa fa-angle-down fa-2x icon-deco'></i>
                      <select class="select-box--menu choosing" name="product[d_method]">
                        <option value="---">---</option>
                        <option value="未定">未定</option>
                        <option value="クロネコヤマト">クロネコヤマト</option>
                        <option value="ゆうパック">ゆうパック</option>
                        <option value="ゆうメール">ゆうメール</option>
                      </select>
                    </div>
                  </div>`
    $(".exhibit-product__delivery__box__delivery").append(method);
  }

  $('#parent-form').on('change', function(){
    var parentCategory = document.getElementById('parent-form').value;
    var url = "/products/children_category"
    if (parentCategory != ""){
      $.ajax({
        url: url,
        type: "GET",
        data: { parent_name: parentCategory },
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_box').remove();
        $('#size_box').remove();
        $('#brand_box').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendSelect(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_box').remove();
      $('#size_box').remove();
      $('#brand_box').remove();
    }
  });

  $('.exhibit-product__detail__box--form').on('change', '#child_category', function(){
    var childId = $('#child_category').val();
    if (childId != "---"){
      $.ajax({
        url: 'grandchild_category',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_box').remove();
          $('#size_box').remove();
          $('#brand_box').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendSelect(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_box').remove();
      $('#size_box').remove();
      $('#brand_box').remove();
    }
  });

  $('.exhibit-product__detail__box--form').on('change', '#grandchild_category', function(){
    var gcName = $('#grandchild_category option:selected').text();
    if ( gcName != "---"){
      $.ajax({
        url: 'product_size_brand',
        type: 'GET',
        data: { category_name: gcName },
        dataType: 'json'
      })
      .done(function(number){
        var num = Object.values(number);
        if (number != ""){
          if (num == 2){
            $('#size_box').remove();
            $('#brand_box').remove();
            appendClothesizeBox();
          }else if (num == 1){
            $('#size_box').remove();
            $('#brand_box').remove();
            appendShoessizeBox();
          }else {
            $('#size_box').remove();
            $('#brand_box').remove();
            appendBrandsizeBox();
          }
        }else{
          $('#grandchildren_box').remove();
          $('#size_box').remove();
          $('#brand_box').remove();
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#size_box').remove();
      $('#brand_box').remove();
    }
  });

  $("#price-form").on("keyup", function () {
    var price = $("#price-form").val();
    var fee = "";
    var profit = "";
    if ( 300 <= price && price <= 9999999 ){
      $("#fee").empty();
      $("#profit").empty();
      fee =  Math.floor( price / 10 );
      profit = price - fee;
      $("#fee").append("¥ " + (Number(fee).toLocaleString()));
      $("#profit").append("¥ " + (Number(profit).toLocaleString()));
    }else{
      $("#fee").empty();
      $("#profit").empty();
      fee = "-";
      profit = "-";
      $("#fee").append(fee);
      $("#profit").append(profit);
    }
  });
  
  $(document).on("keyup", "#brands-search-form", function () {
    var input = $("#brands-search-form").val();
    if (input !== preWord){
      $.ajax({
        type: 'GET',
        url: 'brand_search',
        data: {keyword: input},
        dataType: 'json'
      }) 
      .done(function(brands){
      $("#brands-search-result").empty();
        if(input != ""){
          $("#brands-search-result").show();
          brands.forEach(function(brand){
          appendBrand(brand);
          })
        }else{
          $("#brands-search-result").hide();
          $("#brands-search-result").empty();
        }
      })
      .fail(function(){
        alert('ブランド検索に失敗しました');
      })
    }
    preWord = input;
  });

  $(document).on("click", ".brand-form", function () {
    var brandId = $(this).data("brand-id");
    var brandName = $(this).text();
    $("#brands-search-form").empty();
    document.getElementById( "input_brand" ).value = brandId;
    document.getElementById( "brands-search-form" ).value = brandName.trim();
    $("#brands-search-result").empty();
  });

  $('#delivery_form').on('change', function(){
    $('#method_box').remove();
    var deliveryName = document.getElementById('delivery_form').value;
    var method = "";
    if (deliveryName == "送料込み(出品者負担)" ){
      appendMethod_1(method)
    }else if (deliveryName == "着払い(購入者負担)" ){
      appendMethod_2(method)
    };
  });

  var p_num = 1
  $(document).on("change", ".file", function () {
    var front_img = $(this).parent().parent();
    var img_num = (($('.exhibit-product__view--img__box').children().length) + 1);
    var num = 0;
    var display = "";
    var fileprop = $(this).prop('files')[0];
    var find_img = $(this).parent().find('img');
    var filereader = new FileReader();
    var view_box = $(this).parent(".view_box");
    if(find_img.length){
      find_img.nextAll().remove();
    }
    if ( img_num == 2 ){
      num = 542
    }else if  ( img_num == 3 ){
      num = 404
    }else if  ( img_num == 4 ){
      num = 266 
    }else if  ( img_num == 5 ){
      num = 128
      $(".explanatory_text").css('bottom', "38%");
    }else {
      num = 128
      display = "none";
      $(".explanatory_text").css('display', "none");
    }
    var img = `<div class="img_view">
                <img alt="" class="img">
                <div class="view_option">
                  <div class="view_option--edit">
                    編集
                  </div>
                  <div class="view_option--delete">
                    <div class="img_del">削除</a>
                  </div>
                </div>
              </div>`;
    view_box.append(img);
    filereader.onload = function() {
    view_box.find('img').attr('src', filereader.result);
    }
    filereader.readAsDataURL(fileprop);
    $(front_img).css('width', '128px');
    var img_box = `<div class="img-box" style="width:${num}px; display:${display};">
                    <div class="view_box">
                      <input class="file" type="file" name="product[images_attributes][${p_num}][picture]">
                    </div>
                  </div>`;
    $(".exhibit-product__view--img__box").append(img_box);
    $(".explanatory_text").css('width', num +"px");
    p_num += 1
  });
  
  $(document).on("click", ".img_del", function () {
      var d_num = 0
      var img_delete = ($('.exhibit-product__view--img__box').children().length);
      var parentBox = $(this).parent().parent().parent().parent().parent();
      var last_box = $('.exhibit-product__view--img__box').children().last();
      console.log(img_delete)
      console.log(last_box)
      if ( img_delete == 2 ){
        d_num = 700
        $(".explanatory_text").css('width', d_num +"px");
      }else if  ( img_delete == 3 ){
        d_num = 542
        $(".explanatory_text").css('width', d_num +"px");
      }else if  ( img_delete == 4 ){
        d_num = 404
        $(".explanatory_text").css('width', d_num +"px");
      }else if  ( img_delete == 5 ){
        d_num = 266
        $(".explanatory_text").css('width', d_num +"px");
        $(".explanatory_text").css('bottom', "44%" );
      }else {
        console.log("show")
        d_num = 128
        $(last_box).css("display", "block");
        $(".explanatory_text").css("display", "block");
        $(".explanatory_text").css('bottom', "38%" );
      }
      parentBox.remove();
      $(last_box).css('width', d_num);
      return false;
  });
});