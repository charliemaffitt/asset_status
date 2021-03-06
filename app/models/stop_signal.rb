class StopSignal < ActiveRecord::Base
  belongs_to :start_signal
  validates :stop_time, presence: true

  def elapsed_seconds
    stop_time - start_signal.start_time
  end

  def elapsed_minutes
    elapsed_seconds.round(0) / 60
  end

  def elapsed_hours
    ((elapsed_seconds / 60) / 60).round(2)
  end

  def elapsed_rounded_hours
    (elapsed_hours * 4).round / 4.0
  end
end
