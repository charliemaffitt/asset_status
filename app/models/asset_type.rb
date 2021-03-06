class AssetType < ActiveRecord::Base
  has_many :assets, inverse_of: :asset_type
  validates :name, presence: true
  delegate :count, to: :assets, prefix: true

  def investment_total
    assets.pluck(:value).sum
  end
end
