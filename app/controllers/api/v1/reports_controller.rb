# frozen_string_literal: true

module Api
  module V1
    class ReportsController < ApplicationController
      def index
        result = Report.all
        render json: { status: 'success', reports: result }
      end

      def show
        result = Report.find(params[:id])
        render json: { status: 'success', report: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'land not found' }
      end

      def create
        result = Report.new(report_params)
        render json: { status: 'success', report: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Report.find(params[:id])
        if result.update(report_params)
          render json: { status: 'success',
                         report: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Report.find(params[:id])
        render json: { status: 'success', report: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def report_params
        params.require(:report).permit(:title, :description, :type, :rating)
      end
    end
  end
end
