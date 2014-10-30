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

  def export
    export_timestamp = Time.now.to_i
    CSV.open("/tmp/activities_export_#{export_timestamp}.csv", "wb") do |csv|
      csv << ['DATE', 'LOCATION', 'VOLUNTEER', 'HOURS', 'TRAVEL HOURS', 'DESCRIPTION/NOTES']
      activities = Activity.order('date DESC')
      activities.each do |activity|
        csv << [activity.date, activity.location.name, activity.user.full_name, activity.hours, activity.travel_hours, activity.description]
      end
    end
    send_file "/tmp/activities_export_#{export_timestamp}.csv"
  end

  private

  def activity_params
    params.require(:activity)
      .permit(:user_id, :date, :description, :hours, :location_id, :travel_hours)
  end
end
