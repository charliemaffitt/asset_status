require 'spec_helper'

describe Timecard do

  let(:current_time)  { Time.now }

  before do
    Timecop.freeze(current_time)
  end

  after do
    Timecop.return
  end

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

  describe "#elapsed_seconds" do
    it "returns the time elapsed between start_time and stop_time in seconds" do
      expect(FactoryGirl.build(:timecard, start_time: 1.minute.ago, stop_time: current_time).elapsed_seconds).to eq 60
    end
  end

  describe "#elapsed_rounded_hours" do
    it "rounds elapsed hours up or down to quarter hour increments" do
      expect(FactoryGirl.build(:timecard, start_time: 124.minutes.ago, stop_time: current_time).elapsed_rounded_hours).to eq 2.0
      expect(FactoryGirl.build(:timecard, start_time: 129.minutes.ago, stop_time: current_time).elapsed_rounded_hours).to eq 2.25
      expect(FactoryGirl.build(:timecard, start_time: 145.minutes.ago, stop_time: current_time).elapsed_rounded_hours).to eq 2.50
      expect(FactoryGirl.build(:timecard, start_time: 175.87.minutes.ago, stop_time: current_time).elapsed_rounded_hours).to eq 3.0
    end
  end
end
