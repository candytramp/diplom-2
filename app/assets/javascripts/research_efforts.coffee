nirfunc=->
  $("#check_isnir").bootstrapSwitch()



periods_add = ->
  obj = $(this).data('new-link')
  regexp = new RegExp("new_period", "g")
  obj = obj.replace(regexp, $('.period_item').length + 1)
  $('#period_item').append(obj)

period_remove = ->
  item = $(this).closest('.period_item')
  item.find('.period_destroy').attr('value', 1)
  item.hide()

$ ->
  $(document).on 'click', '.periods_add', periods_add
  $(document).on 'click', '.period_remove', period_remove

$(document).ready nirfunc
$(document).on('page:load', nirfunc)
