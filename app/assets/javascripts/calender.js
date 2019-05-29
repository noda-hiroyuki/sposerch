var events = [];
for (var i in gon.event_data) {
  events.push({title: gon.event_data[i].title, start: gon.event_data[i].date+"T"+gon.event_data[i].start,
               end: gon.event_data[i].date+"T"+gon.event_data[i].end,url: 'http://localhost:3000/topic/show/'+gon.event_data[i].id})
}

$(document).ready(function(){
  $('#calendar').fullCalendar({
    header: {
      left: 'prev, next, today',
      center: 'title',
      right: 'month, agendaWeek, agendaDay, listMonth',
    },
    slotLabelFormat:"HH:mm",
    events: events,
    eventBackgroundColor: '#0000FF',
    noEventsMessage: "イベントありません",
    nowIndicator: true,
  })
});
