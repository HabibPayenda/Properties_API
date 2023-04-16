# frozen_string_literal: true

module Api
  module V1
    class PropertyManagerAddressesController < ApplicationController
      def index
        result = PropertyManagerAddress.all
        render json: { status: 'success', property_manager_addresses: result }
      end

      def show
        result = PropertyManagerAddress.find(params[:id])
        render json: { status: 'success', property_manager_address: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'property manager address not found' }
      end

      def create
        result = PropertyManagerAddress.new(property_manager_address_params)
        render json: { status: 'success', property_manager_address: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = PropertyManagerAddress.find(params[:id])
        if result.update(property_manager_address_params)
          render json: { status: 'success',
                         property_manager_address: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = PropertyManagerAddress.find(params[:id])
        render json: { status: 'success', property_manager_address: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def property_manager_address_params
        params.require(:property_manager_address).permit(:address_id, :property_manager_id)
      end
    end
  end
end
