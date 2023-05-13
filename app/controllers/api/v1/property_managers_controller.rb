# frozen_string_literal: true

# PropertyMangersController
module Api
  module V1
    class PropertyManagersController < ApplicationController
      def index
        result = PropertyManager.all.includes(:agent)

        render json: { status: 'success', property_managers: result }, include: ['agent']
      end

      def show
        result = PropertyManager.includes(:properties, :property_manager_addresses,
                                          :property_manager_reviews).find(params[:id])
        render json: { status: 'success', property_manager: result },
               include: %w[properties property_manager_addresses property_manager_reviews]
      rescue StandardError
        render json: { status: 'failed', info: 'property_manager not found' }
      end

      def create
        property_manager = PropertyManager.new
        property_manager.name = params[:name]
        property_manager.status = params[:status]
        property_manager.company_name = params[:company_name]
        property_manager.agent_id = params[:agent_id]

        address = Address.new if property_manager.save
        address.province = params[:province]
        address.city = params[:city]
        address.district = params[:district]

        property_manager_address = PropertyManagerAddress.new if address.save
        property_manager_address.address_id = address.id
        property_manager_address.property_manager_id = property_manager.id

        contact = Contact.new if property_manager_address.save
        contact.email_one = params[:email_one]
        contact.phone_number_one = params[:phone_number_one]

        property_manager_contact = PropertyManagerContact.new if contact.save
        property_manager_contact.property_manager_id = property_manager.id
        property_manager_contact.contact_id = contact.id

        if property_manager_contact.save
          result = PropertyManager.includes(:properties, :contact, :addresses,
                                            :reviews).find(property_manager.id)
        end

        if result.present?
          render json: { status: 'success', property_manager: result },
                 include: %w[properties contact addresses reviews]
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = PropertyManager.find(params[:id])
        render json: { status: 'success', property_manager: result } if result.update(property_manager_params)
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = PropertyManager.find(params[:id])
        render json: { status: 'success', property_manager: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def get_properties
        homes_result = Home.includes(:property,
                                     :home_rooms).all.where('property_manager_id': params[:id]).order('created_at')
        cars_result = Car.includes(:property).all.where('property_manager_id': params[:id]).order('created_at')
        render json: { status: 'success', homes: homes_result.as_json(include: { property: {}, home_rooms: [] }),
                       cars: cars_result.as_json(include: { property: {} }) }
      end

      private

      def property_manager_params
        params.require(:property_manager).permit(:name, :company_name, :status, :agent_id, :province, :city, :district,
                                                 :phone_number_one, :email_one)
      end
    end
  end
end
