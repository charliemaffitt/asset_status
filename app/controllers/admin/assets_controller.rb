class Admin::AssetsController < Admin::AdminController

  def index
    @assets = Asset.order('created_at DESC')
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

  def export
    CSV.open("/tmp/assets_export.csv", "wb") do |csv|
      assets = Asset.all
      assets.each do |asset|
        csv << [asset.asset_type_name, asset.description, asset.value, asset.status, asset.brand, asset.model, asset.serial_number]
      end
    end
    send_file '/tmp/assets_export.csv'
  end

  private

  def asset_params
    params.require(:asset)
      .permit(:asset_type_id, :admin_id, :borrower_id, :borrowed_on,
              :brand, :description, :model, :serial_number, :status, :value)
  end
end
