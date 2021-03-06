// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-growl.min
//= require moment
//= require moment/ru
//= require bootstrap-datetimepicker
//= require bootstrap-switch
//= require chosen-jquery
//= require raphael
//= require morris
//= require_tree .

/* page:change */

$(document).on("ready page:load", function() {
  $('.side-bar-switcher').click(function() {
    $('.switcher-off').toggleClass("navbar-side-off");
    $('.switcher-on').toggleClass("navbar-side-off");
    $('.navbar-side').toggleClass('navbar-side-close');
//    $('.navbar-side').toggleClass('animated fadeOutLeft');
    $('#main').toggleClass("main-with-side-bar");
    $('#main').toggleClass("main-without-side-bar");
  });
  $('.side-bar-dropdown a').has('.side-bar-opener').click(function() {
    $(this).parent().find('.nav-side-bar-dropdown').toggleClass("navbar-side-off");
    $(this).find('.side-bar-opener').toggleClass("fa-angle-left").toggleClass("fa-angle-down");
  });
  $('.datetimepicker').datetimepicker({locale: 'ru', viewMode: 'years'});
  $('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY', viewMode: 'years'});
  $('.yearpicker').datetimepicker({locale: 'ru', format: 'YYYY', viewMode: 'years'});
  $('.chart').each(function () {
    var chartElement = $(this);
    $.get(chartElement.data('src'), function (data) {
      data.element = chartElement.attr('id');
      Morris.Donut(data);
    });
  });
});
