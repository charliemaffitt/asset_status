class Admin::AdminController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
  before_filter :verify_admin

  private

  def verify_admin
    redirect_to root_path if current_user.admin == true
  end
end
