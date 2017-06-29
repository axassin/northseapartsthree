# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
printDiv = (divID) ->
  divToBePrinted = $(divID).html()

  # Open a new window and set its html with the div to be printed
  newWindow = window.open();
  $(newWindow.document.body).html(divToBePrinted);

  # Run print automatically
  newWindow.print()

  return

# Reads the image data upon file input change
readURL = (input) ->
  if input.files and input.files[0]
    reader = new FileReader

    reader.onload = (e) ->

      appendImages(e.target.result)
        
    reader.readAsDataURL input.files[0]
  return

# Clones images to the print area
appendImages = (data) ->

  numOfCopies = $('#number-of-copies').val();

  # If no value was defined
  if !numOfCopies 
    numOfCopies = 5

  for i in [1..numOfCopies] by 1
    img = $('<img class="sticker=item" style="border: 1px solid; margin: 5px">')
    img.attr 'src', data
    img.appendTo '#print-area'
  return

loadHandlerFunctions = () ->
  $('#select-image-input').change ->
    $("#print-area").empty();
    readURL(this)
    $('#print-button').attr('disabled', false)
    return

  $('#print-button').click ->
    printDiv('#print-area')
    return

  $('#number-of-copies').change ->

    # If print area currently has images, get an image data, reset the print area, and restart recloning
    if $('#print-area').html() != ""
      
      img = $("#print-area img")
      imgData = img.attr('src')
      $('#print-area').empty()

      appendImages(imgData)
    return

$(document).on 'ready', ->	
  loadHandlerFunctions()

