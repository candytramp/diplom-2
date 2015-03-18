show_magazine_fields = ->
  if $('.hidden_collection').is(":visible")
    $('.hidden_collection').hide()
    $('.hidden_magazine').show()
  else
    $('.hidden_magazine').show()
    
show_collection_fields = ->
  if $('.hidden_magazine').is(":visible") 
    $('.hidden_magazine').hide()
    $('.hidden_collection').show()
  else
    $('.hidden_collection').show()


ready=->
  $("#check_rinc").bootstrapSwitch()
  $("#check_russian").bootstrapSwitch()
  
$(document).ready ready
$(document).on('page:load', ready)

$ ->
  $(document).on 'click', '#show_mag_fields', show_magazine_fields
  $(document).on 'click', '#show_coll_fields', show_collection_fields
