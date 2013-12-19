require 'spec_helper'

describe LineItemsController do

  let(:valid_attributes) { { "product_id" => "1", "cart_id" => "1" } }

  let(:invalid_attributes) { { "product_id" => nil } }

  let(:valid_session) { { } }

  let(:product) { FactoryGirl.create(:product) }

  describe "GET index" do
    it "assigns all line_items as @line_items" do
      line_item = LineItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:line_items).should eq([line_item])
    end
  end

  describe "GET show" do
    it "assigns the requested line_item as @line_item" do
      line_item = LineItem.create! valid_attributes
      get :show, {:id => line_item.to_param}, valid_session
      assigns(:line_item).should eq(line_item)
    end
  end

  describe "GET new" do
    it "assigns a new line_item as @line_item" do
      get :new, {}, valid_session
      assigns(:line_item).should be_a_new(LineItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested line_item as @line_item" do
      line_item = LineItem.create! valid_attributes
      get :edit, {:id => line_item.to_param}, valid_session
      assigns(:line_item).should eq(line_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LineItem" do
        # expect {
        #   post :create, {:line_item => valid_attributes}, valid_session
        # }.to change(LineItem, :count).by(1)
        expect {
          post :create, { :line_item => valid_attributes, :product_id => product.id }, valid_session
        }.to change(LineItem, :count).by(1)
      end

      it "assigns a newly created line_item as @line_item" do
        post :create, {:line_item => valid_attributes, :product_id => product.id }, valid_session
        assigns(:line_item).should be_a(LineItem)
        assigns(:line_item).should be_persisted
      end

      it "redirects to the created line_item" do
        post :create, {:line_item => valid_attributes, :product_id => product.id }, valid_session
        response.should redirect_to (Cart.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved line_item as @line_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        post :create, {:line_item => invalid_attributes, :product_id => product.id }, valid_session
        assigns(:line_item).should be_a_new(LineItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        post :create, {:line_item => invalid_attributes, :product_id => product.id }, valid_session
        # post :create, line_item: FactoryGirl.create(:invalid_line_item)
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested line_item" do
        line_item = LineItem.create! valid_attributes
        # Assuming there are no other line_items in the database, this
        # specifies that the LineItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LineItem.any_instance.should_receive(:update).with({ "product_id" => "1" })
        put :update, {:id => line_item.to_param, :line_item => { "product_id" => "1" }}, valid_session
      end

      it "assigns the requested line_item as @line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => valid_attributes}, valid_session
        assigns(:line_item).should eq(line_item)
      end

      it "redirects to the line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => valid_attributes}, valid_session
        response.should redirect_to(line_item)
      end
    end

    describe "with invalid params" do
      it "assigns the line_item as @line_item" do
        line_item = LineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => line_item.to_param, :line_item => { "product_id" => "invalid value" }}, valid_session
        assigns(:line_item).should eq(line_item)
      end

      it "re-renders the 'edit' template" do
        line_item = LineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => line_item.to_param, :line_item => { "product_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested line_item" do
      line_item = LineItem.create! valid_attributes
      expect {
        delete :destroy, {:id => line_item.to_param}, valid_session
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      line_item = LineItem.create! valid_attributes
      delete :destroy, {:id => line_item.to_param}, valid_session
      response.should redirect_to(line_items_url)
    end
  end

end
