$(function() {
  // 親カテゴリーを表示するための処理です。
  function buildParentHTML(parent){
    var html =`<a class="parent_category" id="${parent.id}" 
                href="/category/${parent.id}">${parent.name}</a><br>`;
    return html;
  }

  $(".rootCategory").on("mouseover", function() {
    $.ajax({
      type: 'GET',
      url: '/categories/new',//とりあえずここでは、newアクションに飛ばしてます
      // data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
      dataType: 'json'
    })
    .done(function(parents) {
      parents.forEach(function (parent) {//帰ってきた子カテゴリー（配列）
        var html = buildParentHTML(parent);//HTMLにして
        $(".parent_list").append(html);//リストに追加します
      })
    })
    .fail(function(){
      alert("NG");
    });
  });
});