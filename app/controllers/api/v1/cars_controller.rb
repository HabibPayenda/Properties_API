# frozen_string_literal: true

module Api
  module V1
    class CarsController < ApplicationController
      def index
        result = Car.includes(:property, :agent, :offer, :address, :deal_info).all
        render json: { status: 'success', cars: result.as_json(include: {
            property: {},
            agent: {},
            offer: {},
            address: {},
            deal_info: {}
        }) }
      end

      def show
        result = Car.includes(:property, :agent, :offer, :address, :deal_info).find(params[:id])
        render json: { status: 'success', car: result.as_json(include: {
            property: {},
            agent: {},
            offer: {},
            address: {},
            deal_info: {}
        }) }
      rescue StandardError
        render json: { status: 'failed', info: 'car not found' }
      end

      def create
        property = Property.new
        property.name = params[:name]
        property.description = params[:description]
        property.image = params[:image]
        property.property_manager_id = params[:property_manager_id]
        property.agent_id = params[:agent_id]
        property.property_type = 'car'
        property.availability_status = params[:availability_status]

        car = Car.new if property.save
        car.brand = params[:brand]
        car.model = params[:model]
        car.year = params[:year]
        car.mile_age = params[:mile_age]
        car.transmission = params[:transmission]
        car.fuel_type = params[:fuel_type]
        car.engine_size = params[:engine_size]
        car.body_style = params[:body_style]
        car.identity_number = params[:identity_number]
        car.property_id = property.id
        car.property_manager_id = params[:property_manager_id]
        car.agent_id = params[:agent_id]
        car.image = params[:image]
        car.image_url = car.image.url

        address = Address.new if car.save
        address.province = params[:province]
        address.district = params[:district]
        address.city = params[:city]

        property_address = PropertyAddress.new if address.save
        property_address.property_id = property.id
        property_address.address_id = address.id

        deal_info = DealInfo.new if property_address.save
        deal_info.deal_type = params[:deal_type]
        deal_info.duration = params[:duration]
        deal_info.price_per_duration = params[:price_per_duration]
        deal_info.total_duration = params[:total_duration]
        deal_info.total_price = params[:total_price]
        deal_info.property_id = property.id

        result = Car.includes(:property, :agent, :offer, :address, :deal_info).find(car.id) if deal_info.save


        render json: { status: 'success', car: result.as_json(include: {
                                                                property: {},
                                                                agent: {},
                                                                offer: {},
                                                                address: {},
                                                                deal_info: {}
                                                              }) }

        # rescue StandardError
        #   render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Car.find(params[:id])
        if result.update(car_params)
          render json: { status: 'success',
                         car: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Car.find(params[:id])
        render json: { status: 'success', car: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def car_params
        params.require(:car).permit(:brand, :model, :year, :color, :mile_age, :transmission, :fuel_type, :engine_size,
                                    :body_style, :identity_number, :property_id, :description, :availability_status, :property_manager_id,
                                    :agent_id, :province, :city, :district, :name, :deal_type, :duration, :price_per_duration,
                                    :total_price, :total_duration, :image)
      end
    end
  end
end
