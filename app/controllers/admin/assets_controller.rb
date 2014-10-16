class Admin::AssetsController < ApplicationController
  respond_to :html

  def index
    @assets = Asset.all
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      respond_with @asset, location: admin_assets_path
    else
      render 'new'
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:id)
  end
end
