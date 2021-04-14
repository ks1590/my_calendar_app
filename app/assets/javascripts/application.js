// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery.min
//= require popper
//= require bootstrap-sprockets
//= require jquery-ui.min
//= require moment.min
//= require fullcalendar.min
//= require ja
//= require turbolinks
//= require_tree .


let initialize_calendar;
initialize_calendar = function () {
  $('#calendar').fullCalendar({
    selectable: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    selectable: true,
    selectHelper: true,
    eventClick: function (calEvent, jsEvent, view) {
      //カレンダーへのリンクはさせません。
      // info.jsEvent.preventDefault();
      $('#edit_event').modal('show');
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
      $.getScript('/events/new', function () {
        let str = moment(start).format('YYYY-MM-DD');
        console.log(str);
        $(".start_hidden").val(str);
        $('#new_event').modal('show');
      })

    }
  })
};

$(document).on("turbolinks:load", initialize_calendar);
