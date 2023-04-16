# frozen_string_literal: true

module Api
  module V1
    class AgentAddressesController < ApplicationController
      def index
        result = AgentAddress.all
        render json: { status: 'success', agent_addresses: result }
      end

      def show
        result = AgentAddress.find(params[:id])
        render json: { status: 'success', agent_address: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'agent address not found' }
      end

      def create
        result = AgentAddress.new(agent_addresses_params)
        render json: { status: 'success', agent_address: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = AgentAddress.find(params[:id])
        if result.update(agent_addresses_params)
          render json: { status: 'success',
                         agent_address: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = AgentAddress.find(params[:id])
        render json: { status: 'success', agent_address: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def agent_addresses_params
        params.require(:agent).permit(:address_id, :agent_id)
      end
    end
  end
end
