require 'spec_helper'

describe User do

  describe '#valid' do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name) }
  end

end
