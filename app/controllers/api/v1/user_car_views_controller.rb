# frozen_string_literal: true

module Api
  module V1
    class UserCarViewsController < ApplicationController
      def create
        result = UserCarView.new(user_car_view_params)
        render json: { status: 'success', user_car_view: result } if result.save
      end

      private

      def user_car_view_params
        params.require(:user_car_view).permit(:user_id, car_id)
      end
    end
  end
end
