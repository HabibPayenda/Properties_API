# frozen_string_literal: true

# PropertyMangersController
module Api
  module V1
    class PropertyManagersController < ApplicationController
      def index
        result = PropertyManager.all.includes(:agent)

        render json: { status: 'success', property_managers: result }, include: ['agent']
      end

      def show
        result = PropertyManager.includes(:properties, :property_manager_addresses,
                                          :property_manager_reviews).find(params[:id])
        render json: { status: 'success', property_manager: result },
               include: %w[properties property_manager_addresses property_manager_reviews]
      rescue StandardError
        render json: { status: 'failed', info: 'property_manager not found' }
      end

      def create
        result = PropertyManager.new(property_manager_params)
        render json: { status: 'success', property_manager: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = PropertyManager.find(params[:id])
        render json: { status: 'success', property_manager: result } if result.update(property_manager_params)
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = PropertyManager.find(params[:id])
        render json: { status: 'success', property_manager: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def property_manager_params
        params.require(:property_manager).permit(:name, :company_name, :status, :agent_id)
      end
    end
  end
end
