class Admin::ActivitiesController < Admin::AdminController

  def index
    @activities = Activity.order('date DESC')
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      respond_with @activity, location: admin_activities_path
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      respond_with @activity, location: admin_activities_path
    else
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to admin_activities_path
  end

  private

  def activity_params
    params.require(:activity)
      .permit(:user_id, :date, :description, :hours, :location_id, :travel_hours)
  end
end
