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

      def get_properties
        homes_result = Home.includes(:property, :home_rooms).all.where('property_manager_id': params[:id]).order('created_at')
        cars_result = Car.includes(:property).all.where('property_manager_id': params[:id]).order('created_at')
        render json: { status: 'success', homes: homes_result.as_json(include: { property: {}, home_rooms: [] }),
                       cars: cars_result.as_json(include: { property: {} }) }
      end

      private

      def property_manager_params
        params.require(:property_manager).permit(:name, :company_name, :status, :agent_id)
      end
    end
  end
end
