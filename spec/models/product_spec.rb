require 'spec_helper'

describe Product do
  # let(:product) { Product.new }
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
end
