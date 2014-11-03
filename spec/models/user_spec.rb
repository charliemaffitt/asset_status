require 'spec_helper'

describe User do

  describe "validation" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "is not valid without an email address" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

    it "is not valid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end

    it "is not valid without a first_name" do
      expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
    end

    it "is not valid without a last_name" do
      expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
    end
  end
end
