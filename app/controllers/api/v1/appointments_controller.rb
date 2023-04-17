# frozen_string_literal: true

module Api
  module V1
    class AppointmentsController < ApplicationController
      def index
        result = Appointment.all
        render json: { status: 'success', appointments: result }
      end

      def show
        result = Appointment.find(params[:id])
        render json: { status: 'success', appointment: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'appointment not found' }
      end

      def create
        result = Appointment.new(appointment_params)
        render json: { status: 'success', appointment: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Appointment.find(params[:id])
        if result.update(appointment_params)
          render json: { status: 'success',
                         appointment: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Appointment.find(params[:id])
        render json: { status: 'success', appointment: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def appointment_params
        params.require(:appointment).permit(:date, :time, :status, :notes, :user_id, :property_id, :agent_id)
      end
    end
  end
end
