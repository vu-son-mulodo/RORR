$(document).ready(function(){
  $("#select_userid").change(function() {
    window.location = '/time_trackers/'+$("#select_userid option:selected").val()+'/uid';
  });
});