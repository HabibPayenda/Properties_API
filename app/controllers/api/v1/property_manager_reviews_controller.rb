# frozen_string_literal: true

module Api
  module V1
    class PropertyManagerReviewsController < ApplicationController
      def index
        result = PropertyManagerReview.all
        render json: { status: 'success', property_manager_reviews: result }
      end

      def show
        result = PropertyManagerReview.find(params[:id])
        render json: { status: 'success', property_manager_review: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'property manager review not found' }
      end

      def create
        result = PropertyManagerReview.new(property_manager_review_params)
        render json: { status: 'success', property_manager_review: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = PropertyManagerReview.find(params[:id])
        if result.update(property_manager_review_params)
          render json: { status: 'success',
                         property_manager_review: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = PropertyManagerReview.find(params[:id])
        render json: { status: 'success', property_manager_review: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def property_manager_review_params
        params.require(:property_manager_review).permit(:agent_id, :property_manager_id, :appointment_id, :review_id)
      end
    end
  end
end
