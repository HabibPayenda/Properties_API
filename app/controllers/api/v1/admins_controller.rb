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

      def create
        result = Admin.new(admin_params)
        render json: { status: 'success', admin: result } if result.save
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
