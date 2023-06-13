# frozen_string_literal: true

module Api
  module V1
    class TrainingRecordsController < ApplicationController
      def index
        result = TrainingRecord.all
        render json: { status: 'success', training_records: result }
      end

      def show
        result = TrainingRecord.find(params[:id])
        render json: { status: 'success', training_record: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'training record not found' }
      end

      def create
        result = TrainingRecord.new(training_record_params)
        render json: { status: 'success', training_record: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = TrainingRecord.find(params[:id])
        if result.update(training_record_params)
          render json: { status: 'success',
                         training_record: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = TrainingRecord.find(params[:id])
        render json: { status: 'success', training_record: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def training_record_params
        params.require(:training_record).permit(:score, :trainer_id, :agent_id, :training_id, :description)
      end
    end
  end
end
