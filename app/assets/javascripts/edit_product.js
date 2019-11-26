$(function(){
  $(document).on('turbolinks:load', function(){
    function appendMethod_1(method) {
      var method = `<div class= 'sizeform-box margin-top-40' id= 'method_box'>
                      <label>配送の方法
                        <span class="require">必須
                        </span>
                      </label>
                      <div class='select-box'>
                        <i class='fa fa-angle-down fa-2x icon-deco'></i>
                        <select id="input-method" class="select-box--menu choosing d_method1" name="product[d_method]">
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
                      <div id="error-log-d_method" class="error"></div>
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
                        <select id="input-method" class="select-box--menu choosing d_method2" name="product[d_method]">
                          <option value="---">---</option>
                          <option value="未定">未定</option>
                          <option value="クロネコヤマト">クロネコヤマト</option>
                          <option value="ゆうパック">ゆうパック</option>
                          <option value="ゆうメール">ゆうメール</option>
                        </select>
                      </div>
                      <div id="error-log-d_method" class="error"></div>
                    </div>`
      $(".exhibit-product__delivery__box__delivery").append(method);
    }

      var default_p_status = $('.category-p-status').val();
      $(".parent-edit-form1").val(default_p_status);
      var default_c_status = $('.category-c-status').val();
      $('.parent-edit-form2').val(default_c_status);
      var default_g_status = $('.category-g-status').val();
      $('.parent-edit-form3').val(default_g_status);
      var default_clothe_status = $('.brand_clothe_name').val();
      $('#size').val(default_clothe_status);
      var default_b_name = $('.brand_name').val();
      $('#size1').val(default_b_name);
      var default_status = $('.product-status').val();
      $("#input-status").val(default_status);
      var default_d_charge = $('.product-d_charge').val();
      $("#delivery_form").val(default_d_charge);
      var default_origin = $('.product-d_origin').val();
      $('#input-origin').val(default_origin);
      var default_interval = $('.product-d_interval').val();
      $('#input-interval').val(default_interval);
      var default_price = $('.product-d_price').val();
      $('#price-form').val(default_price);
    
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
      }
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

      $('#method_box').remove();
      var deliveryName = document.getElementById('delivery_form').value;
      var method = "";
      if (deliveryName == "送料込み(出品者負担)" ){
        appendMethod_1(method)
        var default_d_method = $('.product-d_method').val();
        $('#input-method').val(default_d_method);
      }else if (deliveryName == "着払い(購入者負担)" ){
        appendMethod_2(method)
        var default_d_method = $('.product-d_method').val();
        $('#input-method').val(default_d_method);
      };
    });

  var p_num = 1
  $(document).on("change", ".file_edit", function () {
    var front_img = $(this).parent().parent();
    var img_num = (($('.exhibit-product__view--img__box').children().length));
    var num = 0;
    var left = 0;
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
      left = 140
    }else if  ( img_num == 3 ){
      num = 404
      left = 290
    }else if  ( img_num == 4 ){
      num = 266 
      left = 425
    }else if  ( img_num == 5 ){
      num = 128
      left = 562
      $(".exhibit-product__view--img--default").css('top', "35px");
    }else {
      num = 128
      display = "none";
      $(".exhibit-product__view--img--default").css('display', "none");
    }
    var img = `<div class="img_view">
                <img alt="" class="img">
                <div class="view_option">
                  <div class="view_option--edit">
                    編集
                  </div>
                  <div class="view_option--delete">
                    <div class="img_del_edit">削除</a>
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
                      <input class="file_edit" type="file" name="product[images_attributes][${p_num}][picture]">
                    </div>
                  </div>`;
    $(".exhibit-product__view--img__box").append(img_box);
    $(".exhibit-product__view--img--default").css('width', num +"px");
    $(".exhibit-product__view--img--default").css('left', left +"px");
    p_num += 1
  });

  $(document).on("click", ".img_del_edit", function () {
    $(".test").css('width', "100%" );
      var d_num = 0
      var img_delete = ($('.exhibit-product__view--img__box').children().length );
      var parentBox = $(this).parent().parent().parent().parent().parent();
      parentBox.remove();
      var last_box = $('.exhibit-product__view--img__box').children().last();
      if ( img_delete == 3){
        d_num = 700
        $(".exhibit-product__view--img--default").css('width', d_num +"px");
        $(".exhibit-product__view--img--default").css('left', "0px" );
      }else if  ( img_delete == 4 ){
        d_num = 542
        $(".exhibit-product__view--img--default").css('width', d_num +"px");
        $(".exhibit-product__view--img--default").css('left', "140px" );
      }else if  ( img_delete == 5){
        d_num = 404
        $(".exhibit-product__view--img--default").css('width', d_num +"px");
        $(".exhibit-product__view--img--default").css('left', "290px" );
      }else if  ( img_delete == 6 ){
        d_num = 266
        $(".exhibit-product__view--img--default").css('width', d_num +"px");
        $(".exhibit-product__view--img--default").css('left', "425px" );
        $(".exhibit-product__view--img--default").css('top', "65px" );
      }else {
        d_num = 128
        $(last_box).css("display", "block");
        $(".exhibit-product__view--img--default").css("display", "block");
        $(".exhibit-product__view--img--default").css('left', "562px" );
        $(".exhibit-product__view--img--default").css('top', "35px" );
      }
      $(last_box).css('width', d_num);
      return false;
  });
});