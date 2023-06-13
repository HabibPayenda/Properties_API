# frozen_string_literal: true

module Api
  module V1
    class DealsController < ApplicationController
      def index
        result = Deal.all
        render json: { status: 'success', deals: result }
      end

      def show
        result = Deal.find(params[:id])
        render json: { status: 'success', deal: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'deal not found' }
      end

      def create
        result = Deal.new(deal_params)
        render json: { status: 'success', deal: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Deal.find(params[:id])
        if result.update(deal_params)
          render json: { status: 'success',
                         deal: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Deal.find(params[:id])
        render json: { status: 'success', deal: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def deal_params
        params.require(:deal).permit(:user_id, :agent_id, :deal_info_id, :status)
      end
    end
  end
end
