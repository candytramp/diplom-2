show_magazine_fields = ->
  if $('.hidden_collection').is(":visible")
    $('.hidden_collection').hide()
    $('.hidden_magazine').show()
  else
    $('.hidden_magazine').show()
  $("input[name='source_type_mag']").val('on')
  $("input[name='source_type_col']").val('off')
    
show_collection_fields = ->
  if $('.hidden_magazine').is(":visible") 
    $('.hidden_magazine').hide()
    $('.hidden_collection').show()
  else
    $('.hidden_collection').show()
  $("input[name='source_type_mag']").val('off')
  $("input[name='source_type_col']").val('on')

ready=->
  $("#check_rinc").bootstrapSwitch()
  $("#check_russian").bootstrapSwitch()


  load_donut_chart = (selector)->
    url = $('#' + selector + '-donut').data('url')
    $.ajax
      type: 'GET'
      dataType: 'JSON'
      url: url
      data:
        q: $('input[name=q]').val()
      success: (data, textStatus, jqXHR)->
        console.log(data)
        default_data =
          element: selector + '-1'
          resize: true
        $.extend(true, data[0], default_data)
        Morris.Donut data[0]
        default_data =
          element: selector + '-2'
          resize: true
        $.extend(true, data[1], default_data)
        Morris.Donut data[1]
        default_data =
          element: selector + '-3'
          resize: true
        $.extend(true, data[2], default_data)
        Morris.Line data[2]



  if $('#articles-donut').size() > 0
    load_donut_chart('articles')
   if $('#articles-line').size() > 0
    load_line_chart('articles') 

$(document).ready ready
$(document).on('page:load', ready)

$ ->
  $(document).on 'click', '#show_mag_fields', show_magazine_fields
  $(document).on 'click', '#show_coll_fields', show_collection_fields
