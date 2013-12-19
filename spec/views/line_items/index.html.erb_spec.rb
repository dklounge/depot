require 'spec_helper'

describe "line_items/index" do
  before(:each) do
    assign(:line_items, [
      stub_model(LineItem,
        :product_id => 1,
        :cart_id => 2
      ),
      stub_model(LineItem,
        :product_id => 1,
        :cart_id => 2
      )
    ])
  end


  it "renders a list of line_items" do
    render
    assert_select "tr>td", :cart_id => 2.to_s, :count => 14
  end
end
