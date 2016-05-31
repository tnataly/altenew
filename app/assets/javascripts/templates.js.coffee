# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
  event.preventDefault()
  $(this).ekkoLightbox()
  return

$(document).ready ->
  # Turn off automatic editor creation first.
  CKEDITOR.disableAutoInline = true
  CKEDITOR.inline 'inline1',
    extraPlugins: 'sharedspace'
    removePlugins: 'floatingspace,maximize,resize'
    sharedSpaces:
      top: 'top2'
  return
