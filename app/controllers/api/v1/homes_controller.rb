# frozen_string_literal: true

module Api
  module V1
    class HomesController < ApplicationController
      def index
        result = Home.includes(:property).all.order(created_at: :desc)
        render json: { status: 'success', homes: result }, include: ['property']
      end

      def show
        result = Home.includes(:home_rooms, :property, :offer, :deal_info, :restrictions, :amenities,
                               :address).find(params[:id])
        if result.present?
          render json: { status: 'success', home: result.as_json(include: {
                                                                   home_rooms: [],
                                                                   property: {},
                                                                   offer: {},
                                                                   deal_info: {},
                                                                   restrictions: [],
                                                                   amenities: [],
                                                                   address: {}
                                                                 }) }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'home not found' }
      end

      def create
        property = Property.create!(name: params[:name], description: params[:description],
                                    availability_status: params[:availability_status],
                                    property_type: 'Home', agent_id: params[:agent_id],
                                    property_manager_id: params[:property_manager_id], image: params[:image], image_url: '')


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

      def delete_room
        home_room = HomeRoom.find(params[:id])
        home_id = home_room.home_id

        result = Home.includes(:home_rooms, :property).find(home_id) if home_room.destroy
        render json: { status: 'success', home: result },
               include: %w[home_rooms property]
      end

      def create_amenity
        property = Property.find(params[:property_id])
        amenity = Amenity.new
        amenity.name = params[:name]
        amenity.description = params[:description]
        amenity.fee = params[:fee]
        amenity.fee_duration = params[:fee_duration]
        amenity.property_id = property.id

        if amenity.save
          result = Property.includes(:property_addresses, :property_manager, :deal_infos, :restrictions, :agent,
                                     :amenities).find(params[:property_id])
        end
        return unless result.present?

        render json: { status: 'success', property: result },
               include: %w[property_addresses property_manager deal_infos restrictions agent
                           amenities]
      end

      def creat_restriction
        property = Property.find(params[:property_id])
        restriction = Restriction.new
        restriction.name = params[:name]
        restriction.description = params[:description]
        restriction.property_id = property.id

        if restriction.save
          result = Property.includes(:property_addresses, :property_manager, :deal_infos, :restrictions, :agent,
                                     :amenities).find(params[:property_id])
        end
        return unless result.present?

        render json: { status: 'success', property: result },
               include: %w[property_addresses property_manager deal_infos restrictions agent
                           amenities]
      end

      def create_offer
        property = Property.find(params[:id])

        offer = Offer.new if property.present?

        offer.description = params[:description]
        offer.title = params[:title]
        offer.property_id = property.id
        offer.deal_info_id = params[:deal_info_id]
        offer.start_date = params[:start_date]
        offer.end_date = params[:end_date]
        offer.offer_price = params[:offer_price]

        home_offer = HomeOffer.new if offer.save
        home_offer.home_id = params[:home_id]
        home_offer.offer_id = offer.id


        updated_home = Home.includes(:property, :offer).find(params[:home_id]) if home_offer.save
        if updated_home.present?
          updated_property = Property.includes(:property_addresses, :offer, :addresses, :property_manager, :deal_infos, :restrictions, :agent,
                                               :amenities).find(updated_home.property_id)
        end
        return unless updated_property.present?

        render json: {
          status: 'success',
          property: updated_property.as_json(include: {
                                               property_manager: {},
                                               agent: {},
                                               property_addresses: {},
                                               addresses: {},
                                               deal_infos: {},
                                               restrictions: {},
                                               amenities: {},
                                               offer: {}

                                             }),
          home: updated_home.as_json(include: {
                                       property: {},
                                       offer: {}
                                     })
        }
      end

      def update
        home = Home.find(params[:id])
        home.owner_name = params[:owner_name]

        if home.valid?
          property = Property.find(home.property_id)
          property.name = params[:name]
          property.description = params[:description]
          property.availability_status = params[:availability_status]
          property.property_manager_id = params[:property_manager_id]
          property.agent_id = params[:agent_id]
        end

        address = Address.find(property.addresses[0].id) if property.save
        if address.valid?
          address.province = params[:province]
          address.city = params[:city]
          address.district = params[:district]
        end

        deal_info = DealInfo.find(property.deal_infos[0].id) if address.save

        if deal_info.valid?
          deal_info.deal_type = params[:deal_type]
          deal_info.price_per_duration = params[:price_per_duration]
          deal_info.total_price = params[:total_price]
          deal_info.duration = params[:duration]
          deal_info.total_duration = params[:total_duration]
        end

        updated_home = Home.includes(:property).find(params[:id]) if deal_info.save
        if updated_home.present?
          updated_property = Property.includes(:property_addresses, :addresses, :property_manager, :deal_infos, :restrictions, :agent,
                                               :amenities).find(updated_home.property_id)
        end
        if updated_property.present?
          render json: {
            status: 'success',
            property: updated_property.as_json(include: {
                                                 property_manager: {},
                                                 agent: {},
                                                 property_addresses: {},
                                                 addresses: {},
                                                 deal_infos: {},
                                                 restrictions: {},
                                                 amenities: {}

                                               }),
            home: updated_home.as_json(include: :property)
          }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Home.find(params[:id])
        render json: { status: 'success', home: result } if result.destroy
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def search
        search_term = params[:q]
        deal_type = params[:d]
        number_of_rooms = params[:r]

        query = Home.includes(:property, :deal_info, :home_rooms, :address)
                    .joins(:property)
                    .joins(:deal_info)
                    .left_outer_joins(:home_rooms)
                    .where("properties.name ILIKE ?", "%#{search_term}%")
        if number_of_rooms.present?
          query = query.group('homes.id, properties.id, deal_infos.id, addresses.id, home_rooms_homes.id')
                      .having('COUNT(home_rooms.id) = ?', number_of_rooms.to_i)
        end
        if deal_type.present?
          query = query.where("deal_infos.deal_type = ?", deal_type)
        end
        result = query.select('distinct homes.*, properties.*, deal_infos.*, addresses.*')
                     .order(created_at: :desc)
                     .all

        if result.present?
        render json: { status: 'success', homes: result.as_json(include: {
                                                                  property: {},
                                                                    deal_info: {},
                                                                    home_rooms: {},
                                                                    address: {}
                                                                }) }
        else
          render json: { status: 'success', homes: [] }
        end

      end

      private

      def home_params
        params.require(:home).permit(:owner_name, :name, :description, :availability_status, :property_manager_id,
                                     :agent_id, :province, :city, :district, :deal_type, :duration, :price_per_duration, :total_price, :total_duration, :image, :title, :start_date, :end_date, :offer_price, :home_id, :property_id, :deal_info_id)
      end
    end
  end
end
