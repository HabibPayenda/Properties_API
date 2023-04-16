# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController
      def index
        result = Address.all
        render json: { status: 'success', addresses: result }
      end

      def show
        result = Address.find(params[:id])
        render json: { status: 'success', address: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'address not found' }
      end

      def create
        result = Address.new(address_params)
        render json: { status: 'success', address: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Address.find(params[:id])
        if result.update(address_params)
          render json: { status: 'success',
                         address: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Address.find(params[:id])
        render json: { status: 'success', address: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def address_params
        params.require(:address).permit(:province, :city, :district, :latitude, :longitude)
      end
    end
  end
end
