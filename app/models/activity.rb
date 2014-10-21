class Activity < ActiveRecord::Base
  belongs_to :user, inverse_of: :activities
  belongs_to :location, inverse_of: :activities
  validates :user_id, presence: true
  validates :location, presence: true

  def self.total_work_hours
    pluck(:hours).sum
  end
end
