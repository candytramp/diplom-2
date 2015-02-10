# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ruclick = ->
  len = $('.role_user_close').length
  if len > 1
    $(this).parent().parent().parent().find('.role_user_destroy').attr('value', 1) 
    $(this).parent().parent().parent().hide()
  else
    alert('Должно быть не менее 1 роли!');
ruclick2 = ->
  obj = $(this).parent().parent().parent().parent().find('h4[data-new-link]').data('new-link')
  regexp = new RegExp("new_role_users", "g")
  obj = obj.replace(regexp, $('.role_user_line').length + 1)
  obj = $(obj)
  obj.insertAfter($(this).parent().parent().parent())

#$(document).on "ready page:load", ->
#  $('.role_user_close').click ruclick
#  $('.role_user_add').click ruclick2
$ ->
  $(document).on 'click', '.role_user_close', ruclick
  $(document).on 'click', '.role_user_add', ruclick2


    