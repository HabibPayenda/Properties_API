# frozen_string_literal: true

module Api
  module V1
    class HomesController < ApplicationController
      def index
        result = Home.all
        render json: { status: 'success', homes: result }
      end

      def show
        result = Home.find(params[:id])
        render json: { status: 'success', home: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'home not found' }
      end

      def create
        result = Home.new(home_params)
        render json: { status: 'success', home: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Home.find(params[:id])
        if result.update(home_params)
          render json: { status: 'success',
                         home: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Home.find(params[:id])
        render json: { status: 'success', home: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def home_params
        params.require(:home).permit(:owner_name, :property_id)
      end
    end
  end
end
