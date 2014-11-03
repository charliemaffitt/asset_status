class TimecardsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  layout 'timecard'

  def index
    @active_timecard = current_user.timecards.unpublished.first
    if @active_timecard.present?
      redirect_to timecard_path(@active_timecard)
    else
      redirect_to new_timecard_path
    end
  end

  def new
    @timecard = current_user.timecards.new
  end

  def create
    @timecard = current_user.timecards.new(timecard_params.merge(start_time: Time.now))
    if @timecard.save
      respond_with @timecard
    else
      render 'new'
    end
  end

  def show
    respond_with timecard
  end

  def update
    timecard.update_attributes({stop_time: Time.now})
    respond_with timecard
  end

  def publish
    respond_with timecard.activity, location: activity_path(timecard.activity) if timecard.publish_activity
  end

  def destroy
    timecard.destroy
    respond_with nil, location: timecards_path
  end

  private

  def timecard_params
    params.require(:timecard).permit(:location_id, :start_time, :stop_time)
  end

  def timecard
    @timecard ||= Timecard.find(params[:id])
  end
end
