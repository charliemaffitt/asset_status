class TimecardsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  layout 'timecard'

  def index
    @active_timecard = current_user.timecards.unpublished.first
    redirect_to timecard_path(@active_timecard) if @active_timecard.present?
    # @stop_signals = StopSignal.where('created_at > ?', 1.day.ago)
    # @stop_signal = @stop_signals.first if @stop_signals
    # @start_signals = StartSignal.where('created_at > ?', 1.day.ago)
    # @start_signal = @start_signals.first if @start_signals
    # @completed_activities = Activity.where('created_at > ?', 5.minutes.ago)
    # @activity = @completed_activities.first if @completed_activities
  end

  def create
    @timecard = current_user.timecards.new(location_id: 2, start_time: Time.now)
    @timecard.save!
    respond_with @timecard
  end

  def show
    @timecard = Timecard.find(params[:id])
    respond_with @timecard
  end

  def update
    @timecard = Timecard.find(params[:id])
    @timecard.update_attributes({stop_time: Time.now})
    respond_with @timecard
  end

  def publish
    @timecard = Timecard.find(params[:id])
    @activity = Activity.new(user_id: current_user.id, location_id: @timecard.location.id, date: @timecard.stop_time.to_date, hours: @timecard.elapsed_rounded_hours)
    @timecard.update_attributes({published: true}) if @activity.save!
    respond_with @activity, location: timecards_path
  end

  def destroy
    @timecard = Timecard.find(params[:id])
    @timecard.destroy
    respond_with nil, location: timecards_path
  end
end
