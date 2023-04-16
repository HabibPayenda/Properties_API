# frozen_string_literal: true

module Api
  module V1
    class RestrictionsController < ApplicationController
      def index
        result = Restriction.all
        render json: { status: 'success', restrictions: result }
      end

      def show
        result = Restriction.find(params[:id])
        render json: { status: 'success', restriction: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'restriction not found' }
      end

      def create
        result = Restriction.new(restriction_params)
        render json: { status: 'success', restriction: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Restriction.find(params[:id])
        if result.update(restriction_params)
          render json: { status: 'success',
                         restriction: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Restriction.find(params[:id])
        render json: { status: 'success', restriction: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def restriction_params
        params.require(:restriction).permit(:name, :description, :property_id)
      end
    end
  end
end
