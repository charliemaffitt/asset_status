module Api
  module V1
    class ActivitiesController < APIController

      def index
        activities = Activity.order('date DESC')
        respond_with activities
      end

      def create
        activity = Activity.new(activity_params)
        if activity.save
          respond_with activity, location: nil
        else
          errors = "There was an error with your submission".as_json
          respond_with errors.to_json, location: nil, status: :unprocessable_entity
        end
      end

      private

      def activity_params
        params.require(:activity)
          .permit(:user_id, :date, :description, :hours, :location_id, :travel_hours)
      end
    end
  end
end
