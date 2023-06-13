# frozen_string_literal: true

module Api
  module V1
    class PropertyAddressesController < ApplicationController
      def index
        result = PropertyAddress.all
        render json: { status: 'success', property_addresses: result }
      end

      def show
        result = PropertyAddress.find(params[:id])
        render json: { status: 'success', property_address: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'property address not found' }
      end

      def create
        result = PropertyAddress.new(property_address_params)
        render json: { status: 'success', property_address: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = PropertyAddress.find(params[:id])
        if result.update(property_address_params)
          render json: { status: 'success',
                         property_address: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = PropertyAddress.find(params[:id])
        render json: { status: 'success', property_address: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def property_address_params
        params.require(:property_address).permit(:address_id, :property_id)
      end
    end
  end
end
