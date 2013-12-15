require 'spec_helper'

describe LineItem do
  let(:line_item) { LineItem.new }

  describe '#valid?' do
    it { should belong_to(:product) }
    it { should belong_to(:cart) }
  end
end
