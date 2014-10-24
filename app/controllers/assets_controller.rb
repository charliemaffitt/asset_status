class AssetsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json, :html

  def index
    @assets = Asset.includes(:asset_type).order('asset_types.name')
    respond_with @assets
  end

  def check_out
    asset.check_out
    respond_with asset, location: nil, status: :no_content
  end

  def check_in
    asset.check_in
    respond_with asset, location: nil, status: :no_content
  end

  private

  def asset
    @asset ||= Asset.find(params[:id])
  end
end
