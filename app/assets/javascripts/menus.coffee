# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init = ->
  bindDeletePlatillo($('#platillos'))
  bindSearchMenu() if $('form#new_envio').length
  loadMenusCalendar() if $('#menus-calendar').length

bindDeletePlatillo = (scope=$(document)) ->
  scope.find('a.delete').click (e) ->
    e.preventDefault()
    $(this).parents('li.list-group-item').remove()

bindSearchMenu = ->
  $('#envio_desde, #envio_hasta').change (e) ->
    desde = $('#envio_desde').val()
    hasta = $('#envio_hasta').val()
    return unless !!desde && !!hasta
    params = $.param({ desde: desde, hasta: hasta })
    $.getScript "/menus?#{ params }"

loadMenusCalendar = ->
  calendar = $('#menus-calendar').fullCalendar
    events: '/menus.json'
    startParam: 'desde'
    endParam: 'hasta'
    selectable: true
    select: (start, end) ->
      clearClientEvents(calendar)
      createClientEvent(calendar, start, end)

clearClientEvents = (calendar) ->
  calendar.fullCalendar 'removeEvents', (event) ->
    !event.id?

createClientEvent = (calendar, start, end) ->
  date = start.format("YYYY-MM-DD")
  url = "#{ window.location.pathname }/new?fecha=#{ date }"
  calendar.fullCalendar 'renderEvent'
  ,
    title: '+ Nuevo menú'
    start: start
    end: end
    url: url
  , true
  calendar.fullCalendar 'unselect'

$(document).on 'ready page:load', init
window.bindDeletePlatillo = bindDeletePlatillo
