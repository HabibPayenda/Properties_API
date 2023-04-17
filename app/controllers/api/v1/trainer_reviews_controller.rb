# frozen_string_literal: true

module Api
  module V1
    class TrainerReviewsController < ApplicationController
      def index
        result = TrainerReview.all
        render json: { status: 'success', trainer_reviews: result }
      end

      def show
        result = TrainerReview.find(params[:id])
        render json: { status: 'success', trainer_review: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'trainer review not found' }
      end

      def create
        result = TrainerReview.new(trainer_review_params)
        render json: { status: 'success', trainer_review: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = TrainerReview.find(params[:id])
        if result.update(trainer_review_params)
          render json: { status: 'success',
                         trainer_review: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = TrainerReview.find(params[:id])
        render json: { status: 'success', trainer_review: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def trainer_review_params
        params.require(:trainer_review).permit(:agent_id, :trainer_id, :review_id)
      end
    end
  end
end
