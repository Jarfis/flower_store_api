require 'rails_helper'

RSpec.describe Flower, type: :model do

  it "has a valid factory" do
    expect(build(:flower)).to be_valid
  end

  #validation
  describe Flower do
    
    subject { FactoryGirl.build(:flower) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:stock) }

    it { is_expected.to validate_uniqueness_of(:name) }
  end

end