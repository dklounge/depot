class CombineItemsInCart < ActiveRecord::Migration
  def change
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(:product_id => product_id).delete_all
        else
          cart.line_items.create(:product_id => product_id, :quantity => quantity)
        end
      end
    end
  end
end
