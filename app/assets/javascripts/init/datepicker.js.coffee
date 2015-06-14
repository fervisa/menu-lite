init = ->
  $('input.datepicker').datepicker
    language: 'es'
    format: 'yyyy-mm-dd'
    autoclose: true
    orientation: 'top'

$(document).on 'ready page:load', init
