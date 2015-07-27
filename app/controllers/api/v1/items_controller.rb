class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    respond_with Item.create(item_params)
  end

  def update
    respond_with Item.update(params[:id], item_params)
  end

  def find
    render json: Item.find_by(find_params)
  end

  def find_all
    render json: Item.where(find_params)
  end

  def random
    render json: Item.limit(1).order("RANDOM()")
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
