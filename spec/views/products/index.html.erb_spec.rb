require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :image_url => "Image Url",
        :price => "9.99"
      ),
      stub_model(Product,
        :title => "Title",
        :description => "MyText",
        :image_url => "Image Url",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :title => "Title".to_s, :count => 6
    assert_select "tr>td", :description => "MyText".to_s, :count => 6
    assert_select "tr>td", :image_url => "Image Url".to_s, :count => 6
    assert_select "tr>td", :price => "9.99".to_s, :count => 6
  end
end
