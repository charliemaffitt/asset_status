class Activity < ActiveRecord::Base
  belongs_to :user, inverse_of: :activities
  validates :user_id, presence: true
end
