# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init = ->
  bindDeletePlatillo($('#platillos'))

bindDeletePlatillo = (scope=$(document)) ->
  scope.find('a.delete').click (e) ->
    e.preventDefault()
    $(this).parent().remove()

$(document).on 'ready page:load', init
window.bindDeletePlatillo = bindDeletePlatillo
