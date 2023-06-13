# frozen_string_literal: true

module Api
  module V1
    class UserSearchesController < ApplicationController
      def index
        result = UserSearch.all
        render json: { status: 'success', user_searches: result }
      end

      def show
        result = UserSearch.find(params[:id])
        render json: { status: 'success', user_search: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'user search not found' }
      end

      def create
        result = UserSearch.new(user_search_params)
        render json: { status: 'success', user_search: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = UserSearch.find(params[:id])
        if result.update(user_search_params)
          render json: { status: 'success',
                         user_search: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = UserSearch.find(params[:id])
        render json: { status: 'success', user_search: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_search_params
        params.require(:user_search).permit(:term, :user_id)
      end
    end
  end
end
