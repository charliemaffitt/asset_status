class StartSignal < ActiveRecord::Base
  belongs_to :user, inverse_of: :start_signals
  belongs_to :location
  has_one :stop_signal, inverse_of: :start_signal, dependent: :destroy

  validates :start_time, presence: true
end
