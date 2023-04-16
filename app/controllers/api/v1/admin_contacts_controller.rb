# frozen_string_literal: true

module Api
  module V1
    class AdminContactsController < ApplicationController
      def index
        result = AdminContact.all
        render json: { status: 'success', admin_contacts: result }
      end

      def show
        result = AdminContact.find(params[:id])
        render json: { status: 'success', admin_contact: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'admin contact not found' }
      end

      def create
        result = AdminContact.new(admin_contact_params)
        render json: { status: 'success', admin_contact: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = AdminContact.find(params[:id])
        if result.update(admin_contact_params)
          render json: { status: 'success',
                         admin_contact: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = AdminContact.find(params[:id])
        render json: { status: 'success', admin_contact: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def admin_contact_params
        params.require(:admin_contact).permit(:contact_id, :admin_id)
      end
    end
  end
end
