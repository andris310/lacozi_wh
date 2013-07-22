$(document).ready ->
  $.ajax
    url: "/decorative-pillows.json"
    type: "get"
    dataType: "json"
    success: (results) ->
      list = $("#d-pillow-list")
      $(results).each (index, result) ->
        list.append "<li><img src='" + result["picture"]["thumb"]["url"] + "'></li>"

# $(document).ready(function() {
#   $.ajax({
#     url: '/decorative-pillows.json',
#     type: 'get',
#     dataType: 'json',
#     success: function(results) {
#       var list = $('#d-pillow-list');
#       $(results).each(function(index, result) {
#         list.append('<li>' + result['name'] + '</li>');
#       });
#     }
#   });
# });