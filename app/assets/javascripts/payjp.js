// :javascript
  document.addEventListener(
  "DOMContentLoaded", (e) => {
    Payjp.setPublicKey('pk_test_cee9d9ab28f9125a1e80ec49');
    const btn = document.getElementById('token_submit'); //IDがtoken_submitの場合に取得されます
    btn.addEventListener("click", (e) => {//ボタンが押されたときに作動します
      e.preventDefault();//ボタンを一旦無効化します
    
      //カード情報生成
      const card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      }; //入力されたデータを取得します。
      //トークン生成



      Payjp.createToken(card, function(status, response){
        if (status == 200){ //Payjpとの通信が成功した場合
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");

          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //トークンを送信できるように隠しタグを生成          
          document.inputForm.submit();
          alert("登録が完了しました"); //確認用
        } else {
          alert("カード情報が正しくありません。"); //確認用
        };
      });



    });
  },false);
console.log(document)