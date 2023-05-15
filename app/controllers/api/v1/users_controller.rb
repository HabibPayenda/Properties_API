# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        result = User.all

        render json: { status: 'success', users: result }
      end

      def show
        result = User.includes(:contact, :address, :user_views, :reviews, :user_favorites, :user_searches).find(params[:id])
        if result.present?
          render json: { status: 'success', user: result.as_json(include: {
                                                                   contact: {},
                                                                   address: {},
                                                                   user_views: [],
                                                                   reviews: [],
                                                                   user_favorites: [],
                                                                   user_searches: []
                                                                 }) }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'user not found' }
      end

      def create
        user = User.new
        user.name = params[:name]
        user.password = params[:password]
        user.gender = params[:gender]
        user.date_of_birth = params[:date_of_birth]
        user.image = params[:image]

        address = Address.new if user.save
        address.province = params[:province]
        address.city = params[:city]
        address.district = params[:district]

        user_address = UserAddress.new if address.save
        user_address.user_id = user.id
        user_address.address_id = address.id

        contact = Contact.new if user_address.save
        contact.phone_number_one = params[:phone_number_one]
        contact.email_one = params[:email_one]

        user_contact = UserContact.new if contact.save
        user_contact.user_id = user.id
        user_contact.contact_id = contact.id

        result = User.includes(:contact, :address, :user_views, :reviews, :user_favorites, :user_searches).find(user.id) if user_contact.save
        if result.present?
          render json: { status: 'success', user: result.as_json(include: {
                                                                   contact: {},
                                                                   address: {},
                                                                   user_views: [],
                                                                   reviews: [],
                                                                   user_favorites: [],
                                                                   user_searches: []
                                                                 }) }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        user = User.find(params[:id])
        user.name = params[:name]
        user.password = params[:password]
        user.gender = params[:gender]
        user.date_of_birth = params[:date_of_birth]
        user.image = params[:image]
        user.image_url = user.image.url

        address = user.address if user.save
        address.province = params[:province]
        address.city = params[:city]
        address.district = params[:district]
        

        contact = user.contact if address.save
        contact.phone_number_one = params[:phone_number_one]
        contact.email_one = params[:email_one]

        result = User.includes(:contact, :address, :user_views, :reviews, :user_favorites, :user_searches).find(user.id) if contact.save
        if result.present?
          render json: { status: 'success', user: result.as_json(include: {
                                                                   contact: {},
                                                                   address: {},
                                                                   user_views: [],
                                                                   reviews: [],
                                                                   user_favorites: [],
                                                                   user_searches: []
                                                                 }) }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = User.find(params[:id])
        render json: { status: 'success', user: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def user_params
        params.require(:user).permit(:name, :password, :date_of_birth, :gender, :push_token, :last_login, :image, :province, :city, :district, :phone_number_one, :email_one)
      end
    end
  end
end
