$(document).ready(function () {
  //キーワード検索ボタンの有効・無効判定フラグ
  flag_keyword = 1;

  //キーワード検索ボタンの有効・無効処理
  var diable_keyword_button = function(keyword){
    if(keyword == 1){
      $("#keyword_submit").attr("disabled", true);
    }else{
      $("#keyword_submit").removeAttr("disabled");
    }
  }

  //サイトへの遷移・更新時、キーワード検索ボタンを無効にする
  diable_keyword_button(flag_keyword);

  $("#keyword").change(function(){
    //フォーム内容取得
    var keyword = $('#keyword').val();
    if(keyword == ""){
      flag_keyword = 1;
      diable_keyword_button(flag_keyword);
      $("#input_keyword").text("キーワードを入力してください").css({"color": "red"});
    }else{
      flag_keyword = 0;
      diable_keyword_button(flag_keyword);
      $("#input_keyword").text("");
    }
  });


  //カテゴリー検索ボタンの有効・無効判定フラグ
  flag_event = 1;
  flag_st_date = 1;
  flag_en_date = 1;
  flag_date_over = 1;

  //キーワード検索ボタンの有効・無効処理
  var diable_category_button = function(event,st_date,en_date,date_over){
    if(event == 1 || st_date == 1 || en_date == 1 || date_over == 1){
      $("#category_submit").attr("disabled", true);
    }else{
      $("#category_submit").removeAttr("disabled");
    }
  }

  //サイトへの遷移・更新時、カテゴリー検索ボタンを無効にする
  diable_category_button(flag_event,flag_st_date,flag_en_date,flag_date_over);

  $("#eve_s1, #eve_s2, #eve_s3, #eve_s4, #eve_s5, #eve_s6, #eve_s7, #eve_s8, #eve_s9, #eve_s10").change(function(){
    //スポーツ種目チェックボックスの状態取得
    s1 = $("#eve_s1").prop("checked");
    s2 = $("#eve_s2").prop("checked");
    s3 = $("#eve_s3").prop("checked");
    s4 = $("#eve_s4").prop("checked");
    s5 = $("#eve_s5").prop("checked");
    s6 = $("#eve_s6").prop("checked");
    s7 = $("#eve_s7").prop("checked");
    s8 = $("#eve_s8").prop("checked");
    s9 = $("#eve_s9").prop("checked");
    s10 = $("#eve_s10").prop("checked");

    //一つも選択されていない時のエラー処理
    if(s1 == false && s2 == false && s3 == false && s4 == false
       && s5 == false  && s6 == false && s7 == false && s8 == false
       && s9 == false && s10 == false){
       $("#error_sportscheck").text("一つは選択してください").css({"color": "red"});
       flag_event = 1;
       diable_category_button(flag_event,flag_st_date,flag_en_date,flag_date_over);
    }else{
       $("#error_sportscheck").text("");
       flag_event = 0;
       diable_category_button(flag_event,flag_st_date,flag_en_date,flag_date_over);
    }
  });

  $("#datest").change(function(){
    //開始日の状態取得
    start_date = $("#datest").val();
    end_date = $("#dateen").val();

    //開始日を選択していない時のエラー処理
    if(start_date == ""){
      $("#error_start_date").text("開始日を選択してください").css({"color": "red"});
      flag_st_date = 1;
      diable_category_button(flag_event,flag_st_date,flag_en_date,flag_date_over);
    }else{
      $("#error_start_date").text("");
      flag_st_date = 0;
      if(end_date != ""){
       //終了日が開始日よりも前の時のエラー処理
       if(new Date(start_date) > new Date(end_date)){
          $("#error_st_dateover").text("終了日を開始日よりも後日にしてください").css({"color": "red"});
          flag_date_over = 1;
       }else{
          $("#error_st_dateover").text("");
          flag_date_over = 0;
        }
      }
      diable_category_button(flag_event,flag_st_date,flag_en_date,flag_date_over);
    }
  });


  $("#dateen").change(function(){

    start_date = $("#datest").val();
    end_date = $("#dateen").val();

    //終了日を選択していない時のエラー処理
    if(end_date == ""){
      $("#error_end_date").text("終了日を選択してください").css({"color": "red"});
      flag_en_date = 1;
      diable_category_button(flag_event,flag_st_date,flag_en_date,flag_date_over);
    }else{
      $("#error_end_date").text("");
      flag_en_date = 0;
      //終了日が開始日よりも前の時のエラー処理
      if(new Date(start_date) > new Date(end_date)){
        $("#error_st_dateover").text("終了日を開始日よりも後日にしてください").css({"color": "red"});
        flag_date_over = 1;
      }else{
        $("#error_st_dateover").text("");
        flag_date_over = 0;
      }
      diable_category_button(flag_event,flag_st_date,flag_en_date,flag_date_over);
    }
  });
});
