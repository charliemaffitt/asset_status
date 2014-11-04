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

  describe ".total_work_hours" do

    let!(:first_activity)   { FactoryGirl.create(:activity, hours: 17.0) }
    let!(:second_activity)  { FactoryGirl.create(:activity, hours: 3.0) }

    it "sums the work hours of all instances of the class and returns them as a single floating decimal" do
      expect(Activity.total_work_hours).to be_a(Float)
      expect(Activity.total_work_hours).to eq 20.0
    end
  end
end
