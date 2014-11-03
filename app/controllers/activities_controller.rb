class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def index
    @activities = current_user.activities.order('date DESC')
  end

  def show
    @activity = Activity.find(params[:id])
    respond_with @activity
  end
end
