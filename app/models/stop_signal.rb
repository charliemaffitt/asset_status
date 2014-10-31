class StopSignal < ActiveRecord::Base
  belongs_to :start_signal
  validates :stop_time, presence: true
end
