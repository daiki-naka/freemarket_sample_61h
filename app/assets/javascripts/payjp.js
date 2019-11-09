document.addEventListener(
  "turbolinks:load", (e) => {
    Payjp.setPublicKey("pk_test_128e23857e4b57e36c8df31c"); //公開鍵
    const btn = document.getElementById('token_submit'); //IDがtoken_submitの場合に取得されます
    btn.addEventListener("click", (e) => {
      e.preventDefault();

      //カード情報生成
      const card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      }; 

      //トークン生成
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { 
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //トークンを送信できるように隠しタグを生成
          document.inputForm.submit();
          alert("登録が完了しました"); 
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  },false);

