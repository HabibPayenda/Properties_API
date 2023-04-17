# frozen_string_literal: true

module Api
  module V1
    class UserViewsController < ApplicationController
      def index
        result = UserView.all
        render json: { status: 'success', user_views: result }
      end

      def show
        result = UserView.find(params[:id])
        render json: { status: 'success', user_view: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'user view not found' }
      end

      def create
        result = UserView.new(user_view_params)
        render json: { status: 'success', user_view: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = UserView.find(params[:id])
        if result.update(user_view_params)
          render json: { status: 'success',
                         user_view: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = UserView.find(params[:id])
        render json: { status: 'success', user_view: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_view_params
        params.require(:user_view).permit(:property_id, :user_id, :time_spent)
      end
    end
  end
end
