class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def create
    respond_with Invoice.create(invoice_params)
  end

  def update
    respond_with Invoice.update(params[:id], invoice_params)
  end

  def find
    render json: Invoice.find_by(find_params)
  end

  def find_all
    render json: Invoice.where(find_params)
  end

  def random
    render json: Invoice.limit(1).order("RANDOM()")
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, :merchant_id, :status, :created_at, :updated_at)
  end

  def find_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
