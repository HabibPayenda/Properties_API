# frozen_string_literal: true

module Api
  module V1
    class OffersController < ApplicationController
      def index
        result = Offer.all
        render json: { status: 'success', offers: result }
      end

      def show
        result = Offer.find(params[:id])
        render json: { status: 'success', offer: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'offer not found' }
      end

      def create
        result = Offer.new(offer_params)
        render json: { status: 'success', offer: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Offer.find(params[:id])
        if result.update(offer_params)
          render json: { status: 'success',
                         offer: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Offer.find(params[:id])
        render json: { status: 'success', offer: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def offer_params
        params.require(:offer).permit(:start_date, :end_date, :title, :description, :deal_info_id, :offer_price,
                                      :property_id)
      end
    end
  end
end
