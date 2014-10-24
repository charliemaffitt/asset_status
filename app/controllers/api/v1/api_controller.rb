module Api
  module V1
    class APIController < ApplicationController
      respond_to :json
      protect_from_forgery with: :null_session
    end
  end
end
