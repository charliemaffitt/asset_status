class Location < ActiveRecord::Base
  has_many :activities, inverse_of: :location
  has_many :timecards, inverse_of: :location
  validates :name, presence: true

  def total_work_hours
    activities.pluck(:hours).sum
  end
end
