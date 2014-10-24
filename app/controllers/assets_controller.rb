class AssetsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json, :html

  def index
    @assets = Asset.includes(:asset_type).order('asset_types.name')
    respond_with @assets
  end
end
