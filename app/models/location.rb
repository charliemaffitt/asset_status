class Location < ActiveRecord::Base
  has_many :activities, inverse_of: :location
  validates :name, presence: true
end
