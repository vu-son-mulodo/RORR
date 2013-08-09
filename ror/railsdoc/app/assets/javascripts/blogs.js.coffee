# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('#btnSearch').click -> $.ajax( url: base_url+"/blogs/search", type: "POST", dataType: "html", data: { search: $('#search').val() }).done (html) -> $("#result").html(html)