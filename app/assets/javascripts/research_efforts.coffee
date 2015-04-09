nirfunc=->
  $("#check_isnir").bootstrapSwitch()
  $('#research_effort_start_date').parent().on('dp.change', periods_update)
  $('#research_effort_finish_date').parent().on('dp.change', periods_update)

periods_values = {}

periods_update = ->
  start_date = $('#research_effort_start_date').val().split('.')
  finish_date = $('#research_effort_finish_date').val().split('.')
  if start_date.length == 3 && finish_date.length == 3
    year_value = $('#research_effort_year_value')
    year_value.find('input[type=text]').each(-> 
      year_value_input = $(this)
      periods_values[year_value_input.data('year')] = year_value_input.val()
    )
    year_value.html("")
    period_template = year_value.data('period-template')
    for period_year in [+start_date[2] .. +finish_date[2]]
      period_partial = $(period_template.replace(new RegExp("year_number", "g"), period_year))
      period_partial.appendTo(year_value)
      period_partial.find("input[type=text]").val(periods_values[period_year])

period_remove = ->
  item = $(this).parent().find('input[type=text]')
  item.val("")  

$ ->
  $(document).on 'click', '.period_remove', period_remove

$(document).ready nirfunc
$(document).on('page:load', nirfunc)
