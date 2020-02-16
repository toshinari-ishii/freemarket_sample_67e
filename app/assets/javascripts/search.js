$(function() {
  // 親カテゴリーを表示するための処理です。
  function buildParentHTML(parent){
    var html =`<a class="parent_category" id="${parent.id}" 
                href="/category/${parent.id}">${parent.name}</a><br class="parent_category">`;
    return html;
  }

  $(".rootCategory").on("mouseover", function() {
    $(".parent_category").remove();
    $.ajax({
      type: 'GET',
      url: '/category_parent',
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
                href="/category/${child.id}">${child.name}</a><br class="child_category">`;
    return html;
  }

  $(document).on("mouseover", ".parent_category", function() {
    var id = this.id//どのリンクにマウスが乗ってるのか取得します
    $(".child_category").remove();
    $(".grand_child_category").remove();
    $.ajax({
      type: 'GET',
      url: '/category_child',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".children_list").append(html);//リストに追加します
      })
    });
  });


  // 孫カテゴリーを追加するための処理です。
  function buildGrandChildHTML(child){
    var html =`<a class="grand_child_category" id="${child.id}" 
                href="/category/${child.id}">${child.name}</a><br class="grand_child_category">`;
    return html;
  }

  $(document).on("mouseover", ".child_category", function() {
    var id = this.id//どのリンクにマウスが乗ってるのか取得します
    $(".grand_child_category").remove();
    $.ajax({
      type: 'GET',
      url: '/category_grand_child',
      data: {child_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildGrandChildHTML(child);//HTMLにして
        $(".grand_children_list").append(html);//リストに追加します
      })
    });
  });

});