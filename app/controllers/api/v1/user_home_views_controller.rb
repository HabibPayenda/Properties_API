# frozen_string_literal: true

module Api
  module V1
    class UserHomeViewsController < ApplicationController
      def create
        user_home_view = UserHomeView.new(user_home_view_params)
        render json: { status: 'success', result: user_home_view } if user_home_view.save
      end

      private

      def user_home_view_params
        params.require(:user_home_view).permit(:user_id, :home_id)
      end
    end
  end
end
