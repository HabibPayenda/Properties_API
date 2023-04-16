# frozen_string_literal: true

module Api
  module V1
    class AgentsController < ApplicationController
      def index
        result = Agent.all
        render json: { status: 'success', agents: result }
      end

      def show
        result = Agent.find(params[:id])
        render json: { status: 'success', agent: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'agent not found' }
      end

      def create
        result = Agent.new(agent_params)
        render json: { status: 'success', agent: result } if result.save
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Agent.find(params[:id])
        if result.update(agent_params)
          render json: { status: 'success',
                         agent: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Agent.find(params[:id])
        render json: { status: 'success', agent: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def agent_params
        params.require(:agent).permit(:name, :hire_date, :status, :admin_id)
      end
    end
  end
end
