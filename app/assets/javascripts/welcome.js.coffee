# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#signup_btn').click (ev) -> 
    $('#flash_msg').show()
    alert 'it works'
    ev.preventDefault()

$ ->
  $('#signup_btn').popover()
