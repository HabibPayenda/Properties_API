# frozen_string_literal: true

module Api
  module V1
    class SuggestionsController < ApplicationController
      def index
        result = Suggestion.all
        render json: { status: 'success', suggestions: result }
      end

      def show
        result = Suggestion.find(params[:id])
        render json: { status: 'success', suggestion: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'suggestion not found' }
      end

      def create
        result = Suggestion.new(suggestion_params)
        render json: { status: 'success', suggestion: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Suggestion.find(params[:id])
        if result.update(suggestion_params)
          render json: { status: 'success',
                         suggestion: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Suggestion.find(params[:id])
        render json: { status: 'success', suggestion: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def suggestion_params
        params.require(:suggestion).permit(:user_id, :title, :description)
      end
    end
  end
end
