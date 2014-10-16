class Admin::AssetTypesController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!

  def index
    @asset_types = AssetType.all
  end

  def new
    @asset_type = AssetType.new
  end

  def create
    @asset_type = AssetType.new(asset_params)
    if @asset_type.save
      respond_with @asset_type, location: admin_asset_types_path
    else
      render 'new'
    end
  end

  def edit
    @asset_type = AssetType.find(params[:id])
  end

  def update
    @asset_type = AssetType.find(params[:id])
    if @asset_type.update_attributes(asset_params)
      respond_with @asset_type, location: admin_asset_types_path
    else
      render 'edit'
    end
  end

  private

  def asset_params
    params.require(:asset_type).permit(:name)
  end
end
