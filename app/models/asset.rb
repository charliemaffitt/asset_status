class Asset < ActiveRecord::Base
  include AASM

  belongs_to :asset_type, inverse_of: :assets
  validates :asset_type_id, presence: true
  validates :admin_id, presence: true

  delegate :name, to: :asset_type, prefix: true
  delegate :email, to: :admin, prefix: true
  delegate :full_name, to: :admin, prefix: true
  delegate :email, to: :borrower, prefix: true
  delegate :full_name, to: :borrower, prefix: true

  belongs_to :admin, class_name: 'User'
  belongs_to :borrower, class_name: 'User'

  aasm :column => :status do
    state :available, :initial => true
    state :checked_out
  end

  def self.total_value_sum
    pluck(:value).sum
  end
end
