# frozen_string_literal: true

module Api
  module V1
    class UserFavoriteHomesController < ApplicationController
      def create
        user_favorite_home = UserFavoriteHome.new(user_favorite_home_params)
        result = Home.find(user_favorite_home.home_id) if user_favorite_home.save
        render json: { status: 'success', home: result } if result.present?
      end

      def destroy
        user_favorite_home = UserFavoriteHome.where('home_id': params[:id]).first
        render json: {status: 'success', message: 'Favorite removed'} if user_favorite_home.destroy
      end

      private

      def user_favorite_home_params
        params.require(:user_favorite_home).permit(:user_id, :home_id)
      end
    end
  end
end
