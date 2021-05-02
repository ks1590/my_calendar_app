let initialize_calendar;
initialize_calendar = function () {
  $('#calendar').fullCalendar({
    selectable: true,
    dayMaxEvents: true,
    // header: {
    //   left: 'prev,next today',
    //   center: 'title',
    //   // right: 'month'
    header: {
      right: 'prev,next today',
      center: 'title',
      left: ''
    },
    // },
    // height: window.innerHeight - 80, // ①
    // windowResize: function () { // ②
    //   $('#calendar').fullCalendar('option', 'height', window.innerHeight - 80);
    //   $('#calendar').fullCalendar('option', 'width', window.innerWidth - 200);
    // },
    selectable: true,
    selectHelper: true,
    eventLimit: true,
    editable: true,
    disableDragging: true,
    events: "/events.json",
    color: 'yellow',
    textColor: 'black',
    eventColor: 'rgb(44, 50, 141)',

    select: function (start) {
      $.getScript("/events/new", function () {
        let str = moment(start).format('YYYY-MM-DD');
        console.log(str);
        $(".start_hidden").val(str);
        $('#new_event').modal('show');
      })
    },

    eventClick: function (event, jsEvent, view) {
      console.log(event);
      $.getScript(event.edit_url, function () {
        let str = moment(event).format('YYYY-MM-DD');
        console.log(event);
        // $(".start_hidden").val(event);
        $('#edit_event').modal('show');
        // $.ajax({
        //   url: event.update_url,
        //   data: event_data,
        //   type: 'PATCH'
        // });
      })
    },

    // eventClick: function (start) {
    //   let str = moment(start).format('YYYY-MM-DD');
    //   console.log(str);
    //   $(".start_hidden").val(str);
    //   $('#new_event').modal('show');
    // }
  })
};

$(document).on("turbolinks:load", initialize_calendar);
