chosenf = ->
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'
$(document).on "ready page:load", chosenf 

documents_add = ->
  obj = $(this).data('new-link')
  regexp = new RegExp("new_documents", "g")
  obj = obj.replace(regexp, $('.document_item').length + 1)
  $('#document_items').append(obj)

document_remove = ->
  item = $(this).closest('.document_item')
  item.find('.document_destroy').attr('value', 1)
  item.hide()

$ ->
  $(document).on 'click', '.documents_add', documents_add
  $(document).on 'click', '.document_remove', document_remove
