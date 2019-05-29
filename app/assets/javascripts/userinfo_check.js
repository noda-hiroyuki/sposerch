$(document).ready(function () {
  //登録ボタンの有効・無効判定フラグ
  button_flag_email = 1;
  button_flag_name = 1;
  button_flag_password = 1;

  //登録ボタンの有効・無効処理
  var diable_button = function(name,email,password){
    if(name == 1 || email== 1 || password == 1){
      $("#user_new_submit").attr("disabled", true);
    }else{
      $("#user_new_submit").removeAttr("disabled");
    }
  }

  //サイトへの遷移・更新時、登録ボタンを無効にする
  diable_button(button_flag_name,button_flag_email,button_flag_password);

  $("#user_name").change(function(){
    //フォーム内容取得
    var name = $('#user_name').val();
    if(name == ""){
      $("#used_name").text("ユーザー名を入力してください").css({"color": "red"});
    }else if (name.length > 16){
      $("#used_name").text("15文字以内にしてください").css({"color": "red"});
    }else{
      $("#used_name").text("");
      $.ajax({
              url: "/users/user_info_check",
              type: "POST",
              data: ("name=" + name),
              dataType: "json",
              cache: false,
      })
      .done(function(data) {
        var name_messeage = JSON.parse(JSON.stringify(data));
        var result = name_messeage["messeage"];

        if(result == "使用できます"){
          button_flag_name = 0;
        }else if(result == "使用されています"){
          button_flag_name = 1;
        }
        $("#used_name").text(result).css({"color": "red"});
        diable_button(button_flag_name,button_flag_email,button_flag_password);
      })
      .fail(function(XMLHttpRequest, textStatus, errorThrown) {
        alert("error");
        console.log("XMLHttpRequest : " + XMLHttpRequest.status);
        console.log("textStatus     : " + textStatus);
        console.log("errorThrown    : " + errorThrown.message);
      });
    }
  });

  $("#user_email").change(function(){
    //フォーム内容取得
    var email = $('#user_email').val();
    if(email == ""){
      $("#used_email").text("メールアドレスを入力してください").css({"color": "red"});
    }else if(email.match(/[\w+\-]+@[a-z\d\.]+\.[a-z]/) == null){
      $("#used_email").text("〜@〜.〜にしてください").css({"color": "red"});
    }else{
      $("#used_email").text("");
      $.ajax({
              url: "/users/user_info_check",
              type: "POST",
              data: ("email=" + email),
              dataType: "json",
              cache: false,
      })
      .done(function(data) {
        var email_messeage = JSON.parse(JSON.stringify(data));
        var result = email_messeage["messeage"];

        if(result == "使用できます"){
          button_flag_email = 0;
        }else if(result == "使用されています"){
          button_flag_email = 1;
        }
        $("#used_email").text(result).css({"color": "red"});
        diable_button(button_flag_name,button_flag_email,button_flag_password);
      })
      .fail(function(XMLHttpRequest, textStatus, errorThrown) {
        alert("error");
        console.log("XMLHttpRequest : " + XMLHttpRequest.status);
        console.log("textStatus     : " + textStatus);
        console.log("errorThrown    : " + errorThrown.message);
      });
    }
  });

  $("#user_password").change(function(){
    var password = $('#user_password').val();
    var pass_check = password.match(/(?=.*?\d)(?=.*?[a-zA-Z])[0-9a-zA-Z]{8,20}/);
    var pass_length = password.length;

    if(pass_check == null || pass_length < 8 || pass_length > 20){
      $('#password_check').text("8文字以上、20文字以下で英文字、数字を必ず含めてください").css({"color": "red"});
    }else if(password == ""){
      $('#password_check').text("パスワード入力してください").css({"color": "red"});
    }else{
      $('#password_check').text("");
    }
  });

  $("#user_password_confirmation").change(function(){
    //フォーム内容取得
    var password = $('#user_password').val();
    var password_confirmation = $('#user_password_confirmation').val();

    if(password_confirmation == password){
      $("#input_password_confirmation").text("").css({"color": "red"});
      button_flag_password = 0;
    }else{
      $("#input_password_confirmation").text("パスワードが異なります").css({"color": "red"});
      button_flag_password = 1;
    }
    diable_button(button_flag_name,button_flag_email,button_flag_password);
  });
});
