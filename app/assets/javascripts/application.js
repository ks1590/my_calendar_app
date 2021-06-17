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
//= require jquery-ui/widgets/mouse
//= require jquery-ui/widgets/draggable
//= require jquery-ui/widgets/droppable
//= require jquery-ui/widgets/resizable
//= require jquery-ui/widgets/selectable
//= require jquery-ui/widgets/sortable
//= require moment.min
//= require fullcalendar.min
//= require ja
//= require autonumeric
//= require turbolinks
//= require highcharts/highcharts
//= require_tree .

$(function () {

  'use strict';

  $('.js-menu-toggle').click(function (e) {

    var $this = $(this);



    if ($('body').hasClass('show-sidebar')) {
      $('body').removeClass('show-sidebar');
      $this.removeClass('active');
    } else {
      $('body').addClass('show-sidebar');
      $this.addClass('active');
    }

    e.preventDefault();

  });

  // click outisde offcanvas
  $(document).mouseup(function (e) {
    var container = $(".sidebar");
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      if ($('body').hasClass('show-sidebar')) {
        $('body').removeClass('show-sidebar');
        $('body').find('.js-menu-toggle').removeClass('active');
      }
    }
  });
});

$(document).on("turbolinks:load", function () {
  $("#myModal").draggable({
    handle: ".modal-dialog",
    cancel: false
  })
});