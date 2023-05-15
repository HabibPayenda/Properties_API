# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        result = User.all

        render json: { status: 'success', users: result }
      end

      def show
        result = User.includes(:user_reviews, :user_views, :user_searches, :user_favorites, :user_contact,
                               :user_addresses).find(params[:id])
        if result.present?
          render json: { status: 'success', user: result },
                 include: %w[user_reviews user_views user_searches user_favorites user_contact
                             user_addresses]
        end
      rescue StandardError
        render json: { status: 'failed', info: 'user not found' }
      end

      def create
        result = User.new(user_params)
        render json: { status: 'success', user: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = User.find(params[:id])
        render json: { status: 'success', user: result } if result.update(user_params)
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = User.find(params[:id])
        render json: { status: 'success', user: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_params
        params.require(:user).permit(:name, :password, :date_of_birth, :gender, :push_token, :last_login, :image)
      end
    end
  end
end
