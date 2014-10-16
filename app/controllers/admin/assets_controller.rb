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

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])
    if @asset.update_attributes(asset_params)
      respond_with @asset, location: admin_assets_path
    else
      render 'edit'
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:asset_type_id)
  end
end
