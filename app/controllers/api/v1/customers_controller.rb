class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def create
    respond_with Customer.create(customer_params)
  end

  def update
    respond_with Customer.update(params[:id], customer_params)
  end

  def find
    render json: Customer.find_by(find_params)
  end

  def find_all
    render json: Customer.where(find_params)
  end

  def random
    render json: Customer.limit(1).order("RANDOM()")
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :description)
  end

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
