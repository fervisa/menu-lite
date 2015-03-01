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
  $('<li class="list-group-item"></li>').html("
    <a href='#' class='delete pull-right text-danger'>
      <i class='glyphicon glyphicon-remove'></i>
    </a>
    <input type='hidden' value='#{ id }' name='menu[platillo_ids][]' multiple />
    <h4>#{ nombre }</h4>
  ")

$(document).on 'ready page:load', init
window.bindDeletePlatillo = bindDeletePlatillo
