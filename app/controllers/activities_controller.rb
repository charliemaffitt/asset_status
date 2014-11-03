class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def show
    @activity = Activity.find(params[:id])
    respond_with @activity
  end
end
