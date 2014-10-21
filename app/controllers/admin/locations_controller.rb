class Admin::LocationsController < Admin::AdminController

  def index
    @locations = Location.order('created_at DESC')
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      respond_with @location, location: admin_locations_path
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      respond_with @location, location: admin_locations_path
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to admin_locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
