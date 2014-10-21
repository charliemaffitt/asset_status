class AssetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @assets = Asset.includes(:asset_type).order('asset_types.name')
  end
end
