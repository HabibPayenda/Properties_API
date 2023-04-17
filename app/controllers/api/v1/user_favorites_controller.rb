# frozen_string_literal: true

module Api
  module V1
    class UserFavoritesController < ApplicationController
      def index
        result = UserFavorite.all
        render json: { status: 'success', user_favorites: result }
      end

      def show
        result = UserFavorite.find(params[:id])
        render json: { status: 'success', user_favorite: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'user favorite not found' }
      end

      def create
        result = UserFavorite.new(user_favorite_params)
        render json: { status: 'success', user_favorite: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = UserFavorite.find(params[:id])
        if result.update(user_favorite_params)
          render json: { status: 'success',
                         user_favorite: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = UserFavorite.find(params[:id])
        render json: { status: 'success', user_favorite: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_favorite_params
        params.require(:user_favorite).permit(:user_id, :property_id)
      end
    end
  end
end
