require 'spec_helper'

describe Activity do

  describe "validation" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:activity)).to be_valid
    end

    it "is not valid without an associated user" do
      expect(FactoryGirl.build(:activity, user: nil)).to_not be_valid
    end

    it "is not valid without an associated location" do
      expect(FactoryGirl.build(:activity, location: nil)).to_not be_valid
    end
  end
end
