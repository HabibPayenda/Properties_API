# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        result = User.all

        render json: { status: 'success', users: result }
      end

      def show
        result = User.includes(:contact, :address, :user_views, :reviews, :cars, :homes, :lands,
                               :user_searches).find(params[:id])
        if result.present?
          render json: { status: 'success', user: result.as_json(include: {
                                                                   contact: {},
                                                                   address: {},
                                                                   user_views: [],
                                                                   reviews: [],
                                                                   cars: [],
                                                                   homes: { include: :property },
                                                                   lands: [],
                                                                   user_searches: []
                                                                 }) }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'user not not found' }
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

        if user_contact.save
          result = User.includes(:contact, :address, :user_views, :reviews, :user_favorites,
                                 :user_searches).find(user.id)
        end
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

        if contact.save
          result = User.includes(:contact, :address, :user_views, :reviews, :user_favorites,
                                 :user_searches).find(user.id)
        end
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

      def recent_users
        result = User.includes(:contact, :address, :user_views, :reviews, :user_favorites,
                               :user_searches).all.order(created_at: :desc).limit(10)


        render json: { status: 'success', users: result.as_json(include: {
                                                                  contact: {},
                                                                  address: {},
                                                                  user_views: [],
                                                                  reviews: [],
                                                                  user_favorites: [],
                                                                  user_searches: []
                                                                }) }
      end

      def login
        result = User.find_by(name: user_params[:name])
        if result&.authenticate(user_params[:password])

          user_token = encode_token_user({ user_id: result.id, user_name: result.name, date_of_birth: result.date_of_birth,
                                           gender: result.gender })
          render json: { status: 'success', user: result, token: user_token }
        else
          render json: { status: 'failed', info: 'wrong user name or password!' }
        end
      end

      def add_push_token
        result = User.find(params[:id])
        result.push_token = params[:push_token] if result.present?
        render json: { status: 'success', user: result } if result.save
      end

      def upload_profile_image
        result = User.find(params[:id])
        result.image = params[:image]
        result.image_url = result.image.url
        render json: { status: "success", user: result } if result.save
      end

      def last_login
        user = User.find(params[:id])
        user.update(last_login: params[:last_login])
        render json: user
      end

      private

      def user_params
        params.require(:user).permit(:name, :password, :date_of_birth, :gender, :push_token, :last_login, :image,
                                     :province, :city, :district, :phone_number_one, :email_one)
      end
    end
  end
end
