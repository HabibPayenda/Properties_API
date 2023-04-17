# frozen_string_literal: true

module Api
  module V1
    class TrainersController < ApplicationController
      def index
        result = Trainer.all
        render json: { status: 'success', trainers: result }
      end

      def show
        result = Trainer.find(params[:id])
        render json: { status: 'success', trainer: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'trainer not found' }
      end

      def create
        result = Trainer.new(trainer_params)
        render json: { status: 'success', trainer: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Trainer.find(params[:id])
        if result.update(trainer_params)
          render json: { status: 'success',
                         trainer: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Trainer.find(params[:id])
        render json: { status: 'success', trainer: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def trainer_params
        params.require(:trainer).permit(:agent_id, :field)
      end
    end
  end
end
