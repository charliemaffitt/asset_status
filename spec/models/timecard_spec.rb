require 'spec_helper'

describe Timecard do

  describe "validation" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:timecard)).to be_valid
    end

    it "is not valid without a start_time" do
      expect(FactoryGirl.build(:timecard, start_time: nil)).to_not be_valid
    end

    it "is not valid without an associated user" do
      expect(FactoryGirl.build(:timecard, user: nil)).to_not be_valid
    end

    it "is not valid without an associated location" do
      expect(FactoryGirl.build(:timecard, location: nil)).to_not be_valid
    end
  end
end
