class AssetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @assets = Asset.all
  end
end
