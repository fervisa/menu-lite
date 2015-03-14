# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init = ->
  bindDeletePlatillo($('#platillos'))
  bindSearchMenu() if $('form#new_envio').length

bindDeletePlatillo = (scope=$(document)) ->
  scope.find('a.delete').click (e) ->
    e.preventDefault()
    $(this).parent().remove()

bindSearchMenu = ->
  $('#envio_desde, #envio_hasta').change (e) ->
    desde = $('#envio_desde').val()
    hasta = $('#envio_hasta').val()
    return unless !!desde && !!hasta
    params = $.param({ desde: desde, hasta: hasta })
    $.getScript "/menus?#{ params }"


$(document).on 'ready page:load', init
window.bindDeletePlatillo = bindDeletePlatillo
