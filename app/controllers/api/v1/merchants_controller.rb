class Api::V1::MerchantsController < ApplicationController
respond_to :json, :xml

def index
  respond_with Merchant.all
end

def show
  respond_with Merchant.find(params[:id])
end

def create
  respond_with Merchant.create(merchant_params)
end

def update
  respond_with Merchant.update(params[:id], merchant_params)
end

def find
  render json: Merchant.find_by(find_params)
end

def find_all
  render json: Merchant.where(find_params)
end

def random
  render json: Merchant.limit(1).order("RANDOM()")
end

private

def merchant_params
  params.require(:merchant).permit(:name, :created_at, :updated_at)
end

def find_params
  params.permit(:id, :name, :created_at, :updated_at)
end
end
