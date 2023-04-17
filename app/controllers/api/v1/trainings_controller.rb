# frozen_string_literal: true

module Api
  module V1
    class TrainingsController < ApplicationController
      def index
        result = Training.all
        render json: { status: 'success', trainings: result }
      end

      def show
        result = Training.find(params[:id])
        render json: { status: 'success', training: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'training not found' }
      end

      def create
        result = Training.new(training_params)
        render json: { status: 'success', training: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Training.find(params[:id])
        if result.update(training_params)
          render json: { status: 'success',
                         training: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Training.find(params[:id])
        render json: { status: 'success', training: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def training_params
        params.require(:training).permit(:name, :description, :duration)
      end
    end
  end
end
