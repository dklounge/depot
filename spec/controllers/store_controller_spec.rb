require 'spec_helper'

describe StoreController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
      # assert_select '#column #side a', :minimum => 4
    end

    # it "should have a side column" do
    #   get 'index'
    #   response.should have_selector('h3')
    # end

    # it "should have a main entry area" do
    #   visit store_url
    #   page.should have_css '#main'
    # end

    # it "should display item titles" do
    # end

    # it "should display item prices" do
    # end
  end

end
