module Api
  module V1
    class AssetsController < APIController

      def index
        @assets = Asset.includes(:asset_type).order('asset_types.name')
        respond_with @assets
      end

      def check_out
        asset.check_out(current_user || User.first)
        respond_with asset, location: nil, status: :no_content
      end

      def check_in
        asset.check_in
        respond_with asset, location: nil, status: :no_content
      end

      private

      def asset
        @asset ||= Asset.find(params[:id])
      end
    end
  end
end
