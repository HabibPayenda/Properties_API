# frozen_string_literal: true

module Api
  module V1
    class AgentReviewsController < ApplicationController
      def index
        result = AgentReview.all
        render json: { status: 'success', agent_reviews: result }
      end

      def show
        result = AgentReview.find(params[:id])
        render json: { status: 'success', agent_review: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'agent review not found' }
      end

      def create
        result = AgentReview.new(agent_review_params)
        render json: { status: 'success', agent_review: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = AgentReview.find(params[:id])
        if result.update(agent_review_params)
          render json: { status: 'success',
                         agent_review: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = AgentReview.find(params[:id])
        render json: { status: 'success', agent_review: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def agent_review_params
        params.require(:agent_review).permit(:agent_id, :user_id, :appointment_id, :review_id)
      end
    end
  end
end
