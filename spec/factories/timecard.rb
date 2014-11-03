FactoryGirl.define do
  factory :timecard do
    start_time  4.hours.ago
    location
    user
  end
end
