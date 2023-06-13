# frozen_string_literal: true

# ContactsController
module Api
  module V1
    class ContactsController < ApplicationController
      def index
        result = Contact.all

        render json: { status: 'success', contacts: result }
      end

      def show
        result = Contact.find(params[:id])
        render json: { status: 'success', contact: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'contact not found' }
      end

      def create
        result = Contact.new(contact_params)
        render json: { status: 'success', contact: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Contact.find(params[:id])
        render json: { status: 'success', contact: result } if result.update(contact_params)
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Contact.find(params[:id])
        render json: { status: 'success', contact: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def contact_params
        params.require(:contact).permit(:type, :phone_number_one, :phone_number_two, :email_one, :email_two)
      end
    end
  end
end
