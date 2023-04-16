# frozen_string_literal: true

module Api
  module V1
    class PropertiesController < ApplicationController
      def index
        result = Property.all

        render json: { status: 'success', properties: result }
      end

      def show
        result = Property.find(params[:id])
        render json: { status: 'success', property: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'property not found' }
      end

      def create
        result = Property.new(property_params)
        render json: { status: 'success', property: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Property.find[params[:id]]
        render json: { status: 'success', property: result } if result.updated(property_params)
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Property.find(params[:id])
        render json: { status: 'success', property: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def property_params
        params.require(:property).permit(:type, :name, :description, :availability_status, :property_manager_id,
                                         :agent_id)
      end
    end
  end
end
