# frozen_string_literal: true

module Api
  module V1
    class HomesController < ApplicationController
      def index
        result = Home.includes(:property).all
        render json: { status: 'success', homes: result }, include: ['property']
      end

      def show
        result = Home.find(params[:id])
        render json: { status: 'success', home: result } if result.present?
      rescue StandardError
        render json: { status: 'failed', info: 'home not found' }
      end

      def create
        property = Property.create!(name: params[:name], description: params[:description],
                                    availability_status: params[:availability_status],
                                    property_type: 'Home', agent_id: params[:agent_id],
                                    property_manager_id: params[:property_manager_id])
        puts property
        puts property.id
        if property.valid?
          result = Home.new(property_id: property.id, owner_name: params[:owner_name]) if property.save
          render json: { status: 'success', home: result }, include: ['property'] if result.save
        end
      rescue StandardError
        render json: { status: 'failed', info: 'check your data' }
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
                                     :agent_id)
      end
    end
  end
end
