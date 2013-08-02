$(document).ready(function() {
    $('#btnSearch').click(function() {
      return $.ajax({
        url: "/blogs/search",
        type: "POST",
        dataType: "html",
        data: {
          search: $('#search').val()
        }
      }).done(function(html) {
        return $("#result").html(html);
      });
    });
});
