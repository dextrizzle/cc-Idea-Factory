# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.idea-body').hide()
  $('.idea-title').click ->
    $(this).find('.idea-body').slideToggle()

$(".a-unique-class").html('<%= j render "ideas/_form/" %>')