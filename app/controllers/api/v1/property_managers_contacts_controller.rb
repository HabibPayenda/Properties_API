# frozen_string_literal: true

module Api
  module V1
    class PropertyManagersContactsController < ApplicationController

      def index
        result = PropertyManagerContact.all
        render json: { status: 'success', property_managers_contacts: result }
      end

      def show
        result = PropertyManagerContact.find(params[:id])
        render json: { status: 'success', property_managers_contact: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'user not found' }
      end

      def create
        result = PropertyManagerContact.new(property_manager_contact_params)
        render json: { status: 'success', property_managers_contact: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = PropertyManagerContact.find(params[:id])
        if result.update(property_manager_contact_params)
          render json: { status: 'success',
                         property_managers_contact: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = PropertyManagerContact.find(params[:id])
        render json: { status: 'success', property_managers_contact: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def property_manager_contact_params
        params.require(:property_managers_contact).permit(:contact_id, :user_id)
      end
    end
  end
end
