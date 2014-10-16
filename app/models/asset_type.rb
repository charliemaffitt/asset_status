class AssetType < ActiveRecord::Base

  has_many :assets, inverse_of: :asset_type
  validates :name, presence: true

end
