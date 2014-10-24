class AssetsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def index
    @assets = Asset.includes(:asset_type).order('asset_types.name')
    respond_with @assets
  end

  def check_out
    asset.check_out(current_user)
    respond_with asset, location: assets_path
  end

  def check_in
    asset.check_in
    respond_with asset, location: assets_path
  end

  private

  def asset
    @asset ||= Asset.find(params[:id])
  end
end
