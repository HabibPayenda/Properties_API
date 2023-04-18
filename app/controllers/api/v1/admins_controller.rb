# frozen_string_literal: true

module Api
  module V1
    class AdminsController < ApplicationController
      def index
        result = Admin.all
        render json: { status: 'success', admins: result }
      end

      def show
        result = Admin.find(params[:id])
        render json: { status: 'success', admin: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'admin not found' }
      end

      def login
        result = Admin.find_by(name: admin_params[:name])
        if result&.authenticate(admin_params[:password])

          admin_token = encode_token({ admin_id: result.id, admin_role: result.role, admin_status: result.status })
          render json: { status: 'success', admin: result, token: admin_token }
        else
          render json: { status: 'failed', info: 'wrong admin name or password!' }
        end
      end

      def create
        result = Admin.new(admin_params)
        if result.valid?
          admin_token = encode_token({ admin_id: result.id, admin_role: result.role, admin_status: result.status })
          render json: { status: 'success', admin: result, token: admin_token } if result.save
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def update
        result = Admin.find(params[:id])
        if result.update(admin_params)
          render json: { status: 'success',
                         admin: result }
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      def delete
        result = Admin.find(params[:id])
        render json: { status: 'success', admin: result } if result.delete
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
      end

      private

      def admin_params
        params.require(:admin).permit(:name, :password, :role, :status, :last_login_at, :last_login_ip)
      end
    end
  end
end
