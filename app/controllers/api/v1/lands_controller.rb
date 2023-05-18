# frozen_string_literal: true

module Api
  module V1
    class LandsController < ApplicationController
      def index
        result = Land.all
        render json: { status: 'success', lands: result }
      end

      def show
        result = Land.find(params[:id])
        render json: { status: 'success', land: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'land not found' }
      end

      def create
        property = Property.new
        property.property_type = 'land'

        render json: { status: 'success', land: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Land.find(params[:id])
        if result.update(land_params)
          render json: { status: 'success',
                         land: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Land.find(params[:id])
        render json: { status: 'success', land: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def land_params
        params.require(:land).permit(:area, :zone, :current_use, :property_id)
      end
    end
  end
end
