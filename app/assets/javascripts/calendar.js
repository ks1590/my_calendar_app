let initialize_calendar;
initialize_calendar = function () {
  $('#calendar').fullCalendar({
    selectable: true,
    dayMaxEvents: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      // right: 'month'
    },
    selectable: true,
    selectHelper: true,
    eventLimit: true,
    editable: true,
    disableDragging: true,

    eventClick: function (calEvent, jsEvent, view) {
      //カレンダーへのリンクはさせません。
      // info.jsEvent.preventDefault();
      $('#new_event').modal('show');
    },
    // eventRender: function (eventObj, el) {
    //   $(el).popover({
    //     title: eventObj.title,
    //     content: eventObj.description,
    //     trigger: 'hover',
    //     placement: 'top',
    //     container: 'body',
    //     html: true
    //   });
    // },   
    events: "/events.json",
    color: 'yellow',
    textColor: 'black',
    select: function (start) {

      let str = moment(start).format('YYYY-MM-DD');
      console.log(str);
      $(".start_hidden").val(str);
      $('#new_event').modal('show');
      // $.getScript('/events/new', function () {})
    },

    eventClick: function (event) {
      $.getScript(event.edit_url, function () {
        $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
      });
    }
  })
};

$(document).on("turbolinks:load", initialize_calendar);
