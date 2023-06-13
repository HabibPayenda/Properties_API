# frozen_string_literal: true

module Api
  module V1
    class UserReviewsController < ApplicationController
      def index
        result = UserReview.all
        render json: { status: 'success', user_reviews: result }
      end

      def show
        result = Land.find(params[:id])
        render json: { status: 'success', user_review: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'user review not found' }
      end

      def create
        result = Land.new(user_review_params)
        render json: { status: 'success', user_review: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Land.find(params[:id])
        if result.update(user_review_params)
          render json: { status: 'success',
                         user_review: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Land.find(params[:id])
        render json: { status: 'success', user_review: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_review_params
        params.require(:user_review).permit(:agent_id, :user_id, :appointment_id, :review_id)
      end
    end
  end
end
