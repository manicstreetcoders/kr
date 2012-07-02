# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#signup_btn').popover()

$ ->
  $('#facebook_btn').click (ev) ->
    alert '준비중'
    ev.preventDefault()

$ ->
  $("#mytags").tagit()
