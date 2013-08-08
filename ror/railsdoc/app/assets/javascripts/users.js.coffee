# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('#searchbox').keyup -> $.ajax(url: "/rails/users/search", type: "POST", dataType: "html", data: {key: $('#searchbox').val()}).done (json) -> $("#loadsearch").html(json)