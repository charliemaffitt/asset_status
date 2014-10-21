FactoryGirl.define do
  factory :location do
    name  'Trail Creek Trails'
  end

  factory :physical_address, :parent => :address
end
