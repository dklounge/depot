$('#cart').html("<%= escape_javascript render current_cart %>");

$('form').on('submit', function (event) {
  console.log('This line runs without issue');
  event.preventDefault();

  // the following relates to view/line_items/_line_item.html.erb
  $("#current_item").effect("highlight", { color: "#88ff88" }, 1000);
});
