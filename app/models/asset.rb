class Asset < ActiveRecord::Base
  belongs_to :asset_type, inverse_of: :assets
  validates :asset_type_id, presence: true
  validates :admin_id, presence: true

  delegate :name, to: :asset_type, prefix: true
end
