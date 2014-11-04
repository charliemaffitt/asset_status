require 'spec_helper'

describe Location do

  describe "validation" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:location)).to be_valid
    end

    it "is not valid without a name" do
      expect(FactoryGirl.build(:location, name: nil)).to_not be_valid
    end
  end

  describe ".total_work_hours" do

    let(:location)          { FactoryGirl.create(:location) }
    let(:second_location)   { FactoryGirl.create(:location) }
    let!(:first_activity)   { FactoryGirl.create(:activity, hours: 17.0, location: location) }
    let!(:second_activity)  { FactoryGirl.create(:activity, hours: 3.0, location: location) }
    let!(:third_activity)   { FactoryGirl.create(:activity, hours: 8.5, location: second_location) }

    it "sums the work hours of all associated activites and returns them as a single floating decimal" do
      expect(location.total_work_hours).to be_a(Float)
      expect(location.total_work_hours).to eq 20.0
      expect(second_location.total_work_hours).to eq 8.5
    end
  end
end
