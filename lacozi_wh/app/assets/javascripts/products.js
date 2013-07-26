// getItems = (link, cssid) ->
//   $.ajax
//     url: link
//     type: "get"
//     dataType: "json"
//     success: (results) ->
//       list = $(cssid)
//       $(results).each (index, result) ->
//         item = $("<li><img src='" + result["picture"]["thumb"]["url"] + "'></li>")
//         list.append item
//         item.attr('item_id', result["id"])

function getItems(link, cssid) {
  $.ajax({
    url: link,
    type: 'get',
    dataType: 'json',
    success: function(results) {
      var list = $(cssid);
      $(results).each (function(index, result) {
        var item = $("<li><img src='" + result["picture"]["thumb"]["url"] + "'></li>");
        list.append(item);
        item.attr('item_id', result["id"]);
      });
    }
  });
}


// $(document).ready ->
//   $('#dec-pillows').load(getItems('/decorative-pillows.json', '#dec-pillows'))
//   $('#duvet-sets').load(getItems('/duvet-sets.json', '#duvet-sets'))


  // $('.list').on('click', 'li', ->
  //   info = $('#product-data')
  //   li = $(this)
  //   itemId = li.attr('item_id')
  //   info.html('')
  //   $.ajax
  //     url: '/product-details.json'
  //     data: q: info
  //     debugger
  //     type: 'get'
  //     dataType: 'json'
  //     success: (result) ->
  //       info.append('some text here')
  //       console.log(result)
  //   )



$(document).ready(function() {
  $('#dec-pillows').load(getItems('/decorative-pillows.json', '#dec-pillows'));
  $('#duvet-sets').load(getItems('/duvet-sets.json', '#duvet-sets'));


  $('.list').on('click', 'li', function() {
    var info = $('#product-data');
    var li = $(this);
    var itemId = li.attr('item_id');
    info.html('');

    $.ajax({
      url: '/product-details.json',
      data: { q: itemId },
      dataType: 'json',
      success: function(result) {
        info.append($('<h2>' + result[0]['name'] + '</h2>'));
      }
    })
  });
 });