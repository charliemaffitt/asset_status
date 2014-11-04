class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  layout 'timecard'

  def index
    @activities = current_user.activities.order('created_at DESC')
  end

  def show
    @activity = Activity.find(params[:id])
    respond_with @activity
  end
end
