class TimeclockController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def index
    @stop_signals = StopSignal.where('created_at > ?', 1.day.ago)
    @stop_signal = @stop_signals.first if @stop_signals
    @start_signals = StartSignal.where('created_at > ?', 1.day.ago)
    @start_signal = @start_signals.first if @start_signals
    @completed_activities = Activity.where('created_at > ?', 5.minutes.ago)
    @activity = @completed_activities.first if @completed_activities
  end

  def create
    @start_signal = current_user.start_signals.new(location_id: 2, start_time: Time.now)
    @start_signal.save!
    respond_with @start_signal, location: timeclock_index_path
  end

  def update
    @start_signal = StartSignal.find(params[:id])
    @stop_signal = @start_signal.build_stop_signal(stop_time: Time.now)
    @stop_signal.save!
    respond_with @stop_signal, location: timeclock_index_path
  end

  def publish
    @stop_signal = StopSignal.find(params[:id])
    @activity = Activity.new(user_id: current_user.id, location_id: @stop_signal.start_signal.location.id, date: @stop_signal.stop_time.to_date, hours: @stop_signal.elapsed_hours.round(1))
    @stop_signal.start_signal.destroy if @activity.save!
    respond_with @activity, location: timeclock_index_path
  end

  def destroy
    @stop_signal = StopSignal.find(params[:id])
    @stop_signal.start_signal.destroy
    respond_with nil, location: timeclock_index_path
  end
end
