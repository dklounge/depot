$('#cart').html("<%= escape_javascript render current_cart %>");

$('form').on('submit', function (event) {
  console.log('This line runs without issue');
  event.preventDefault();

  // the following relates to view/line_items/_line_item.html.erb
  $("#current_item").effect("highlight", { color: "#88ff88" }, 1000);
});

// From Chapter 12 - to hide #notice after order
// page.select('#notice').each { |notice| notice.hide }

// page.replace_html('cart', render @cart)
// page[:cart].visual_effect :blind_down if @cart.total_items == 1
// page[:current_item].visual_effect :highlight, :startcolor => '#88ff88', :endcolor => "#114411"
