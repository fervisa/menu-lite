# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init = ->
  $('form#platillos_form').submit (e) ->
    e.preventDefault()
    id = $('#platillo_id :selected').val()
    nombre = $('#platillo_id :selected').text()
    platilloDiv = $('<div></div>').html("
        <input type='hidden' value='#{ id }' name='menu[platillo_ids][]' multiple />
        #{ nombre }
      ")
    $('#platillos').append platilloDiv

$(document).on 'ready page:load', init
