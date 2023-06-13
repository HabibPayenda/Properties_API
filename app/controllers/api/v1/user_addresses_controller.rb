# frozen_string_literal: true

module Api
  module V1
    class UserAddressesController < ApplicationController
      def index
        result = UserAddress.all
        render json: { status: 'success', user_addresses: result }
      end

      def show
        result = UserAddress.find(params[:id])
        render json: { status: 'success', user_address: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'land not found' }
      end

      def create
        result = UserAddress.new(user_address_params)
        render json: { status: 'success', user_address: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = UserAddress.find(params[:id])
        if result.update(user_address_params)
          render json: { status: 'success',
                         user_address: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = UserAddress.find(params[:id])
        render json: { status: 'success', user_address: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_address_params
        params.require(:user_address).permit(:address_id, :user_id)
      end
    end
  end
end
