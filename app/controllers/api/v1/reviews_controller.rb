# frozen_string_literal: true

module Api
  module V1
    class ReviewsController < ApplicationController
      def index
        result = Review.all
        render json: { status: 'success', reviews: result }
      end

      def show
        result = Review.find(params[:id])
        render json: { status: 'success', review: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'review not found' }
      end

      def create
        result = Review.new(review_params)
        render json: { status: 'success', review: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Review.find(params[:id])
        if result.update(review_params)
          render json: { status: 'success',
                         review: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Review.find(params[:id])
        render json: { status: 'success', review: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def review_params
        params.require(:review).permit(:type, :rating, :text)
      end
    end
  end
end
