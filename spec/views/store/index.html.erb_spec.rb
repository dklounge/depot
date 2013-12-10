require 'spec_helper'

describe "store/index" do
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
    assert_select "div", :title => "Title".to_s, :count => 2
    assert_select "div", :description => "MyText".to_s, :count => 2
    assert_select "div", :image_url => "Image Url".to_s, :count => 2
    assert_select "div", :price => "9.99".to_s, :count => 2
  end
end
