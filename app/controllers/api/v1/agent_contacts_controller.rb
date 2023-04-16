# frozen_string_literal: true

module Api
  module V1
    class AgentContactsController < ApplicationController
      def index
        result = AgentContact.all
        render json: { status: 'success', agents_contacts: result }
      end

      def show
        result = AgentContact.find(params[:id])
        render json: { status: 'success', agent_contact: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'user not found' }
      end

      def create
        result = AgentContact.new(agent_contact_params)
        render json: { status: 'success', agent_contact: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = AgentContact.find(params[:id])
        if result.update(agent_contact_params)
          render json: { status: 'success',
                         agent_contact: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = AgentContact.find(params[:id])
        render json: { status: 'success', agent_contact: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def agent_contact_params
        params.require(:property_managers_contact).permit(:contact_id, :agent_id)
      end
    end
  end
end
