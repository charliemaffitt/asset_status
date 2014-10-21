require 'spec_helper'

describe Location do

  describe "validation" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:location)).to be_valid
    end

    it "is not valid without a name" do
    end
  end
end
