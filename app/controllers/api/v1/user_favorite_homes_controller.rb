module API
  module V1
    class UserFavoriteHomesController < ApplicationController
      def create
        user_favorite_home = UserFavoriteHome.new(user_favorite_home_params)
        render json: { status: 'success', message: 'Entry created successfully' } if user_favorite_home.save
      end
      private
      def user_favorite_home_params
        params.require(:user_favorite_home).permit(:user_id, :home_id)
      end
    end
  end
end