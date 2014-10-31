class StopSignal < ActiveRecord::Base
  belongs_to :start_signal
  validates :stop_time, presence: true

  def elapsed_minutes
    (stop_time - start_signal.start_time).round(0) / 60
  end

  def elapsed_hours
    elapsed_minutes / 60
  end
end
