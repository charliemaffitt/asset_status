FactoryGirl.define do
  factory :activity do
    hours         1.0
    travel_hours  0.5
    description   'Did some work'
    date          Date.today
    location
    user
  end
end
