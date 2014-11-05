module Api
  module V1
    class APIController < ApplicationController
      respond_to :json
      doorkeeper_for :all
      protect_from_forgery with: :null_session

      private

      def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token && doorkeeper_token.resource_owner_id
      end
    end
  end
end
