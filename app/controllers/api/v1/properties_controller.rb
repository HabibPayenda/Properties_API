class Api::V1::PropertiesController < ApplicationController

  def index
    result = Property.all

    render json: { status: 'success', properties: result }
  end

  def show
    result = Property.find(params[:id])

    render json: { status: 'success', property: result }
  end

  def create
    result = Property.create(property_params)

    render json: { status: 'success', property: result }
  end

  def update
    result = Property.find[params[:id]]
    result.update(property_params)

    render json: { status: 'success', property: result }
  end

  def delete
    result = Property.find(params[:id])
    result.delete()

    render json: { status: 'success', property: result }
  end

  private

  def property_params
    params.require(:property).permit(:type, :name, :description, :availability_status, property_manager_id, agent_id)
  end
end
