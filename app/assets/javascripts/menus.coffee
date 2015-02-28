# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init = ->
  bindDeletePlatillo($('#platillos'))

  $('form#platillos_form').submit (e) ->
    e.preventDefault()
    id = $('#platillo_id :selected').val()
    nombre = $('#platillo_id :selected').text()
    platilloDiv = createPlatilloRow(id, nombre)
    bindDeletePlatillo(platilloDiv)

    $('#platillos').append platilloDiv

bindDeletePlatillo = (scope=$(document)) ->
  scope.find('a.delete').click (e) ->
    e.preventDefault()
    $(this).parent().remove()

createPlatilloRow = (id, nombre) ->
  $('<div></div>').html("
    <input type='hidden' value='#{ id }' name='menu[platillo_ids][]' multiple />
    #{ nombre }
    <a href='#' class='delete'>X</a>
  ")

$(document).on 'ready page:load', init
window.bindDeletePlatillo = bindDeletePlatillo
