# frozen_string_literal: true

module Api
  module V1
    class UserCarViewsController < ApplicationController
      def create
        user_car_view = UserCarView.new(user_car_view_params)
        render json: {status: 'success', user_car_view} if user_car_view.save

        private

        def user_car_view_params
          params.require(:user_car_view).permit(:user_id, car_id)
        end
      end
    end
  end
end
