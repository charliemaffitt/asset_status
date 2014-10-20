class Admin::AssetsController < Admin::AdminController

  def index
    @assets = Asset.order('created_at DESC')
    @asset_sum = @assets.pluck(:value).sum
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

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    redirect_to admin_assets_path
  end

  private

  def asset_params
    params.require(:asset)
      .permit(:asset_type_id, :admin_id, :borrower_id,
              :brand, :description, :model, :serial_number, :status, :value)
  end
end
