class Asset < ActiveRecord::Base
  belongs_to :asset_type, inverse_of: :asset
  validates :asset_type_id, presence: true
end
