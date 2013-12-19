require 'spec_helper'

describe Cart do
  let(:cart) { Cart.new }

  describe '#valid' do
    it { should have_many(:line_items).dependent(:destroy) }
  end

  describe '#add_product' do
    xit '' do
    end
  end
end
