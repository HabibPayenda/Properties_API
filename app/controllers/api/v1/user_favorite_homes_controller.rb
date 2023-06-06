# frozen_string_literal: true

module Api
  module V1
    class UserFavoriteHomesController < ApplicationController
      def create
        user_favorite_home = UserFavoriteHome.new(user_favorite_home_params)
        render json: { status: 'success', message: 'Entry created successfully' } if user_favorite_home.save
      end

      def destroy
        user_favorite_home = UserFavoriteHome.find(params[:id])
        render json: {status: 'success', message: 'Favorite removed'} if user_favorite_home.destroy
      end

      private

      def user_favorite_home_params
        params.require(:user_favorite_home).permit(:user_id, :home_id)
      end
    end
  end
end
