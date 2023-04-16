# frozen_string_literal: true

module Api
  module V1
    class AmenitiesController < ApplicationController
      def index
        result = Amenity.all
        render json: { status: 'success', amenities: result }
      end

      def show
        result = Amenity.find(params[:id])
        render json: { status: 'success', amenity: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'amenity not found' }
      end

      def create
        result = Amenity.new(amenity_params)
        render json: { status: 'success', amenity: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Amenity.find(params[:id])
        if result.update(amenity_params)
          render json: { status: 'success',
                         amenity: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Amenity.find(params[:id])
        render json: { status: 'success', amenity: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def amenity_params
        params.require(:amenity).permit(:name, :description, :fee, :fee_duration, :property_id)
      end
    end
  end
end
