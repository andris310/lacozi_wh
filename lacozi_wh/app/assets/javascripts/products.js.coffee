getItems = (link, cssid) ->
  $.ajax
    url: link
    type: "get"
    dataType: "json"
    success: (results) ->
      list = $(cssid)
      $(results).each (index, result) ->
        item = $("<li><img src='" + result["picture"]["thumb"]["url"] + "'></li>")
        list.append item
        item.attr('item_id', result["id"])


$(document).ready ->
  $('#dec-pillows').load(getItems('/decorative-pillows.json', '#dec-pillows'))
  $('#duvet-sets').load(getItems('/duvet-sets.json', '#duvet-sets'))


  $('.list').on('click', 'li' ->
    item_id = $(this).attr('item_id')
    $.ajax
      url: '/item-details'
      type: 'get'
      dataType: 'json'
      success: ->
        console.log('got data')
    )



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