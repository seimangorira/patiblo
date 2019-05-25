$(function() {
  $('#textarea1').val();
  $('#textarea1').trigger('autoresize');
  $(".alert1").on("click", function(){
    alert("本当に削除しますか？")
  });
});

