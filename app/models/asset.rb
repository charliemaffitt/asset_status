class Asset < ActiveRecord::Base
  belongs_to :asset_type, inverse_of: :asset
  validates :asset, presence: true
end
