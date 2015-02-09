# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  $('.role_user_close').click ->
    len = $('.role_user_close').length
    if len > 1
      $(this).parent().parent().parent().remove() 
    else
      alert('Должно быть не менее 1 роли!');