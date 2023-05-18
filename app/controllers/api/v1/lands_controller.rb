# frozen_string_literal: true

module Api
  module V1
    class LandsController < ApplicationController
      def index
        result = Land.all
        render json: { status: 'success', lands: result }
      end

      def show
        result = Land.find(params[:id])
        render json: { status: 'success', land: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'land not found' }
      end

      def create
        property = Property.new
        property.property_type = 'land'
        property.image = params[:image]
        property.image_url = property.image.url
        property.name = params[:name]
        property.description = params[:description]
        property.availability_status = params[:availability_status]
        property.agent_id = params[:agent_id]
        property.property_manager_id = params[:property_manager_id]

        address = Address.new if property.save
        address.province = params[:province]
        address.city = params[:city]
        address.district = params[:district]

        property_address = PropertyAddress.new if address.save
        property_address.address_id = address.id
        property_address.property_id = property.id

        land = Land.new if property_address.save
        land.area = params[:area]
        land.zone = params[:zone]
        land.current_use = params[:current_use]
        land.property_id = property.id
        land.property_manager_id = params[:property_manager_id]
        land.agent_id = params[:agent_id]
        land.image = params[:image]
        land.image_url = land.image.url

        deal_info = DealInfo.new if land.save
        deal_info.property_id = property.id
        deal_info.price_per_duration = params[:price_per_duration]
        deal_info.total_price = params[:total_price]
        deal_info.duration = params[:duration]
        deal_info.total_duration = params[:total_duration]

        result = Land.includes(:property, :agent, :property_manager, :offer, :address, :deal_info).find(land.id)
        render json: { status: 'success', land: result.as_json(include: {
            property: {},
            agent: {},
            property_manager: {},
            offer: {},
            address: {},
            deal_info: {}
        }) }


      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Land.find(params[:id])
        if result.update(land_params)
          render json: { status: 'success',
                         land: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Land.find(params[:id])
        render json: { status: 'success', land: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def land_params
        params.require(:land).permit(:area, :zone, :current_use, :property_id, :name, :description, :availability_status, :property_manager_id,
            :agent_id, :province, :city, :district, :deal_type, :duration, :price_per_duration, :total_price, :total_duration, :image, :title, :start_date, :end_date, :offer_price, :home_id, :property_id, :deal_info_id)
      end
    end
  end
end
