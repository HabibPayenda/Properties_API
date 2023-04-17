class Api::V1::PropertyReportsController < ApplicationController
  def index
    result = PropertyReport.all
    render json: { status: 'success', property_reports: result }
  end

  def show
    result = PropertyReport.find(params[:id])
    render json: { status: 'success', property_report: result } if result.present?
  rescue StandardError
    render json: { status: 'failed', info: 'property report not found' }
  end

  def create
    result = PropertyReport.new(property_report_params)
    render json: { status: 'success', property_report: result } if result.save
  rescue StandardError
    render json: { status: 'failed', info: 'check your data' }
  end

  def update
    result = PropertyReport.find(params[:id])
    if result.update(property_report_params)
      render json: { status: 'success',
                     property_report: result }
    end
  rescue StandardError
    render json: { status: 'failed', info: 'check your data' }
  end

  def delete
    result = PropertyReport.find(params[:id])
    render json: { status: 'success', property_report: result } if result.delete
  rescue StandardError
    render json: { status: 'failed', info: 'check your data' }
  end

  private

  def property_report_params
    params.require(:property_report).permit(:report_id, :user_id, :property_id)
  end
end
