$(document).ready(function(){
  var event = gon.event.id;
  var cookie_name = 'recently_viewed_event';
  var viewed_events = [];
  var delete_events = false;
  var cookie_path = '/';


  if($.cookie(cookie_name)){
      viewed_events = $.cookie(cookie_name).split(",");
  }

  // 重複していなければ、eventを配列に追加
  if($.inArray(String(event), viewed_events) == -1){
      viewed_events.push(event);
  }
  // 30個以上ならば1つ削除
  if (viewed_events.length >= 31){
      viewed_events.shift();
  }

  // 配列をクッキ―に保存
  $.cookie(cookie_name, viewed_events,{path: '/', expires: 365});
});
