$(function () {
  function appendOption(category) {
    var html = `<option value="${category.id}" data-category="${category.name}">${category.name}</option>`;
    return html;
  }
  //子カテゴリーの表示
  function buildChild(insertHTML) {
    var childSelect = ``
    var childSelect = `<select class="contents__detail__main__box__cate__select" name="item[category_id]" id="child-cate"><option value="">---</option>
    ${insertHTML}
  </select>`
    $('.contents__detail__main__box__cate').append(childSelect);
  }
  // 孫カテゴリーの表示
  function buildGrandChild(insertHTML) {
    var grandChildSelect = '';
    var grandChildSelect = `<select class="contents__detail__main__box__cate__select" name="item[category_id]" id="grandchild-cate"><option value="">---</option>
  ${insertHTML}
</select>`
$('.contents__detail__main__box__cate').append(grandChildSelect);
}
// 親カテゴリーを選択した場合
  $(".contents__detail__main__box__cate").on("change","#parent_category",function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "---") { //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        // console.log(children);
        $("#edit-children").remove();
        $("#edit-grandchildren").remove();
        $('#child-cate').remove(); //親が変更された時、子以下を削除する
        $('#grandchild-cate').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        buildChild(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }

  });
  // 子カテゴリーを選択した場合
  $(".contents__detail__main__box__cate").on("change", "#child-cate", function () {
    var childCategory = document.getElementById("child-cate").value;
    if (childCategory != "---") { //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'grandchildren',
        type: 'GET',
        data: { child_name: childCategory },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchild-cate').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        buildGrandChild(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }

  });
});
