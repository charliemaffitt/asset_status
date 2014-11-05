module Api
  module V1
    class UserController < APIController

      def index
        @user = current_resource_owner
        respond_with @user
      end
    end
  end
end
