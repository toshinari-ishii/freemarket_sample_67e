$(function() {
  // 子カテゴリーを追加するための処理です。
  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/category/${child.id}">${child.name}</a>`;
    return html;
  }

  $(".rootCategory").on("mouseover", function() {
    $.ajax({
      type: 'GET',
      url: '/categories/new',//とりあえずここでは、newアクションに飛ばしてます
      // data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
      dataType: 'json'
    })
    .done(function(children) {
      alert("OK")
      // children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
      //   var html = buildChildHTML(child);//HTMLにして
      //   $(".children_list").append(html);//リストに追加します
      // })
    })
    .fail(function(){
      alert("NG");
    });
  });
});