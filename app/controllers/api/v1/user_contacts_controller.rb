# frozen_string_literal: true

module Api
  module V1
    class UserContactsController < ApplicationController
      def index
        result = UserContact.all
        render json: { status: 'success', user_contacts: result }
      end

      def show
        result = UserContact.find(params[:id])
        render json: { status: 'success', user_contact: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'user not found' }
      end

      def create
        result = UserContact.new(user_contact_params)
        render json: { status: 'success', user_contact: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = UserContact.find(params[:id])
        if result.update(user_contact_params)
          render json: { status: 'success',
                         user_contact: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = UserContact.find(params[:id])
        render json: { status: 'success', user_contact: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_contact_params
        params.require(:property_managers_contact).permit(:contact_id, :user_id)
      end
    end
  end
end
