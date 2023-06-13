# frozen_string_literal: true

module Api
  module V1
    class DealInfosController < ApplicationController
      def index
        result = DealInfo.all
        render json: { status: 'success', deal_infos: result }
      end

      def show
        result = DealInfo.find(params[:id])
        render json: { status: 'success', deal_info: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'deal info not found' }
      end

      def create
        result = DealInfo.new(deal_info_params)
        render json: { status: 'success', deal_info: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = DealInfo.find(params[:id])
        if result.update(deal_info_params)
          render json: { status: 'success',
                         deal_info: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = DealInfo.find(params[:id])
        render json: { status: 'success', deal_info: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def deal_info_params
        params.require(:deal_info).permit(:type, :duration, :price_per_duration, :total_price, :total_duration,
                                          property_id)
      end
    end
  end
end
