getItems = (link, id) ->
  $.ajax
    url: link
    type: "get"
    dataType: "json"
    success: (results) ->
      list = $(id)
      $(results).each (index, result) ->
        list.append "<li><img src='" + result["picture"]["thumb"]["url"] + "'></li>"

$(document).ready ->
  $('#dec-pillows').load(getItems('/decorative-pillows.json', '#dec-pillows'))
  $('#duvet-sets').load(getItems('/duvet-sets.json', '#duvet-sets'))



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