# frozen_string_literal: true

module Api
  module V1
    class CarsController < ApplicationController
      def index
        result = Car.all
        render json: { status: 'success', cars: result }
      end

      def show
        result = Car.find(params[:id])
        render json: { status: 'success', car: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'car not found' }
      end

      def create
        result = Car.new(car_params)
        render json: { status: 'success', car: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Car.find(params[:id])
        if result.update(car_params)
          render json: { status: 'success',
                         car: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Car.find(params[:id])
        render json: { status: 'success', car: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def car_params
        params.require(:car).permit(:brand, :model, :year, :color, :mile_age, :transmission, :fuel_type, engine_size,
                                    :body_style, :identity_number, :property_id)
      end
    end
  end
end
