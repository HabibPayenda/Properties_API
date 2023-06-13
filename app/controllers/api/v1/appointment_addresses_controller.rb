# frozen_string_literal: true

module Api
  module V1
    class AppointmentAddressesController < ApplicationController
      def index
        result = AppointmentAddress.all
        render json: { status: 'success', appointment_addresses: result }
      end

      def show
        result = AppointmentAddress.find(params[:id])
        render json: { status: 'success', appointment_address: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'appointment address not found' }
      end

      def create
        result = AppointmentAddress.new(land_params)
        render json: { status: 'success', appointment_address: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = AppointmentAddress.find(params[:id])
        if result.update(land_params)
          render json: { status: 'success',
                         appointment_address: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = AppointmentAddress.find(params[:id])
        render json: { status: 'success', appointment_address: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def appointment_address_params
        params.require(:appointment_address).permit(:appointment_id, :address_id)
      end
    end
  end
end
