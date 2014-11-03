FactoryGirl.define do
  factory :user do
    first_name        'Earving'
    last_name         'Winkleson'
    sequence(:email)  { |n| "earving#{n}@winkleson.com" }
    password          'MyTest1234'
  end
end
