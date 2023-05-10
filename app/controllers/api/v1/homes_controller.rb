# frozen_string_literal: true

module Api
  module V1
    class HomesController < ApplicationController
      def index
        result = Home.includes(:property).all
        render json: { status: 'success', homes: result }, include: ['property']
      end

      def show
        result = Home.includes(:home_rooms, :property).find(params[:id])
        render json: { status: 'success', home: result }, include: %w[home_rooms property] if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'home not found' }
      end

      def create
        property = Property.create!(name: params[:name], description: params[:description],
                                    availability_status: params[:availability_status],
                                    property_type: 'Home', agent_id: params[:agent_id],
                                    property_manager_id: params[:property_manager_id])

        return unless property.valid?

        deal_info = DealInfo.new
        deal_info.property_id = property.id
        deal_info.duration = params[:duration]
        deal_info.total_duration = params[:total_duration]
        deal_info.price_per_duration = params[:price_per_duration]
        deal_info.total_price = params[:total_price]
        deal_info.deal_type = params[:deal_type]

        if deal_info.save
          home = Home.new(property_id: property.id, owner_name: params[:owner_name], agent_id: params[:agent_id],
                          property_manager_id: params[:property_manager_id])
        end

        address = Address.new if home.save
        address.province = params[:province]
        address.city = params[:city]
        address.district = params[:district]

        home_address = PropertyAddress.new if address.save
        home_address.property_id = property.id
        home_address.address_id = address.id
        result = Home.includes(:property).find(home.id) if home_address.save

        render json: { status: 'success', home: result }, include: ['property'] if result.save

        # rescue StandardError
        #   render json: { status: 'failed', info: 'check your data' }
      end

      # def room_params
      #   params.require(:home).permit(:width, :lengths, :windows, :cup_board, :to_sun, :color, :home_id)
      # end

      def create_room
        result = Home.includes(:home_rooms, :property).find(params[:home_id])
        room = HomeRoom.new if result.valid?
        room.color = params[:color]
        room.cup_board = params[:cup_board]
        room.home_id = result.id
        room.width = params[:width]
        room.length = params[:length]
        room.to_sun = params[:to_sun]
        room.windows = params[:windows]
        updated_home = Home.includes(:home_rooms, :property).find(params[:home_id]) if room.save
        return unless updated_home.present?

        render json: { status: 'success', home: updated_home },
               include: %w[home_rooms property]
      end

      def update_room
        home_room = HomeRoom.find(params[:room_id])
        if home_room.valid?
        home_room.windows = params[:windows]
        home_room.length = params[:length]
        home_room.width = params[:width]
        home_room.to_sun = params[:to_sun]
        home_room.cup_board = params[:cup_board]
        home_room.color = params[:color]
        end
        result = Home.includes(:home_rooms, :property).find(params[:home_id]) if home_room.save
        render json: { status: 'success', home: result },
               include: %w[home_rooms property]
      end

      def update
        result = Home.find(params[:id])
        if result.update(home_params)
          render json: { status: 'success',
                         home: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Home.find(params[:id])
        render json: { status: 'success', home: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def home_params
        params.require(:home).permit(:owner_name, :name, :description, :availability_status, :property_manager_id,
                                     :agent_id, :province, :city, :district, :deal_type, :duration, :price_per_duration, :total_price, :total_duration)
      end
    end
  end
end
