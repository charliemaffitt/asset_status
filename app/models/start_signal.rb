class StartSignal < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :start_time, presence: true
end
