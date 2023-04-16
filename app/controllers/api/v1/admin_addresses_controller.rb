# frozen_string_literal: true

module Api
  module V1
    class AdminAddressesController < ApplicationController
      def index
        result = AdminAddress.all
        render json: { status: 'success', admin_addresses: result }
      end

      def show
        result = AdminAddress.find(params[:id])
        render json: { status: 'success', admin_address: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'land not found' }
      end

      def create
        result = AdminAddress.new(admin_address_params)
        render json: { status: 'success', admin_address: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = AdminAddress.find(params[:id])
        if result.update(admin_address_params)
          render json: { status: 'success',
                         admin_address: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = AdminAddress.find(params[:id])
        render json: { status: 'success', admin_address: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def admin_address_params
        params.require(:admin_address).permit(:address_id, :admin_id)
      end
    end
  end
end
