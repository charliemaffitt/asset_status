class Activity < ActiveRecord::Base
  belongs_to :user, inverse_of: :activities
  belongs_to :location, inverse_of: :activities
  has_one :timecard, inverse_of: :activity
  validates :user_id, presence: true
  validates :location, presence: true
  validates :date, presence: true

  def self.total_work_hours
    pluck(:hours).sum
  end
end
