class Admin::AdminController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
end
