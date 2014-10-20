class Admin::AssetTypesController < Admin::AdminController

  def index
    @asset_types = AssetType.order('created_at DESC')
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

  def destroy
    @asset_type = AssetType.find(params[:id])
    @asset_type.destroy
    redirect_to admin_asset_types_path
  end

  private

  def asset_params
    params.require(:asset_type).permit(:name)
  end
end
