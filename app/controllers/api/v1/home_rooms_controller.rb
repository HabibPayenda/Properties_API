# frozen_string_literal: true

module Api
  module V1
    class HomeRoomsController < ApplicationController
      def index
        result = HomeRoom.all
        render json: { status: 'success', home_rooms: result }
      end

      def show
        result = HomeRoom.find(params[:id])
        render json: { status: 'success', home_room: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'home not found' }
      end

      def create
        result = HomeRoom.new(home_rooms_params)
        render json: { status: 'success', user_contact: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = HomeRoom.find(params[:id])
        if result.update(home_rooms_params)
          render json: { status: 'success',
                         home_room: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = HomeRoom.find(params[:id])
        render json: { status: 'success', home_room: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def home_rooms_params
        params.require(:home_room).permit(:width, :length, :windows, :cup_board, :to_sun, :color, home_id)
      end
    end
  end
end
