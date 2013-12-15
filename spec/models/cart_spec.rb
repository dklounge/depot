require 'spec_helper'

describe Cart do
  let(:cart) { Cart.new }

  describe '#valid' do
    it { should have_many(:line_items).dependent(:destroy) }
  end
end
