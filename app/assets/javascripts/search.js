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
        $(".parents_list").append(html);//リストに追加します
      })
    })
    .fail(function(){
      alert("NG");
    });
  });

  // 子カテゴリーを追加するための処理です。
  function buildChildHTML(child){
    var html =`<a class="child_category" id="${child.id}" 
                href="/category/${child.id}">${child.name}</a>`;
    return html;
  }

  $(".parent_category").on("mouseover", function() {
    var id = this.id//どのリンクにマウスが乗ってるのか取得します
    $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのためです
    $('#' + id).addClass("now-selected-red");//赤色のcssのためです
    $(".child_category").remove();//一旦出ている子カテゴリ消します！
    $(".grand_child_category").remove();//孫、てめえもだ！
    $.ajax({
      type: 'GET',
      url: '/category/new',//とりあえずここでは、newアクションに飛ばしてます
      data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".children_list").append(html);//リストに追加します
      })
    });
  });


});