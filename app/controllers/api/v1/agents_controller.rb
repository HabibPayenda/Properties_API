# frozen_string_literal: true

module Api
  module V1
    class AgentsController < ApplicationController
      before_action :authorize_admin
      def index
        result = Agent.includes(:addresses, :contact, :properties, :property_managers).order(:created_at).all
        render json: { status: 'success', agents: result },
               include: %w[addresses contact properties property_managers]
      end

      def show
        result = Agent.includes(:addresses, :contact, :properties, :property_managers).find(params[:id])
        if result.present?
          render json: { status: 'success', agent: result },
                 include: %w[addresses contact properties
                             property_managers]
        end
      rescue StandardError
        render json: { status: 'failed', info: 'agent not found' }
      end

      def create
        agent = Agent.new
        agent.name = params[:name]
        agent.hire_date = params[:hire_date]
        agent.admin_id = params[:admin_id]
        agent.status = params[:status]

        contact = Contact.new if agent.save
        contact.email_one = params[:email_one]
        contact.phone_number_one = params[:phone_number_one]


        agent_contact = AgentContact.new if contact.save
        agent_contact.agent_id = agent.id
        agent_contact.contact_id = contact.id

        address = Address.new if agent_contact.save
        address.province = params[:province]
        address.city = params[:city]
        address.district = params[:district]

        agent_address = AgentAddress.new if address.save
        agent_address.agent_id = agent.id
        agent_address.address_id = address.id

        if agent_address.save
          result = Agent.includes(:agent_contact, :agent_addresses,
                                  :property_managers, :properties).find(agent.id)
        end

        if result.present?
          render json: { status: 'success', agent: result },
                 include: %w[agent_contact agent_addresses property_managers properties]
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        agent = Agent.find(params[:id])
        if agent.valid?
          agent.name = params[:name]
          agent.hire_date = params[:hire_date]
          agent.status = params[:status]
          agent.admin_id = params[:admin_id]
        end
        address = Address.find(agent.addresses[0].id) if agent.save
        if address.valid?
          address.province = params[:province]
          address.city = params[:city]
          address.district = params[:district]
        end

        contact = Contact.find(agent.contact.id) if address.save

        if contact.valid?
          contact.phone_number_one = params[:phone_number_one]
          contact.email_one = params[:email_one]
        end
        result = Agent.includes(:addresses, :contact, :properties, :property_managers).find(params[:id]) if contact.save
        if result.present?
          render json: { status: 'success', agent: result },
                 include: %w[addresses contact properties
                             property_managers]
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
        params.require(:agent).permit(:name, :hire_date, :status, :admin_id, :province, :city, :district,
                                      :phone_number_one, :email_one)
      end
    end
  end
end
