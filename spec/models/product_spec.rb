require 'spec_helper'

describe Product do
  let(:product) { Product.new }

  describe '#relationships' do
    it { should have_many(:line_items) }
  end

  describe '#valid?' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
  end

  describe '#ensure_not_referenced_by_any_line_item' do
    context 'if there are no line items' do
      it 'returns true' do
        product.ensure_not_referenced_by_any_line_item.should be_true
      end
    end

    context 'if line items exist' do
      it 'returns false' do
        product = Product.create(:title => "title", :price => 5,
             :image_url => 'example.com/image.jpg',
             :description => "test item")
        lines = FactoryGirl.create(:line_item)
        product.line_items = [lines]
        product.ensure_not_referenced_by_any_line_item.should be_false
      end
    end
  end

end
