require 'rails_helper'

describe Api::V1::ItemsController do
  context '#index' do
    it 'returns all of the items' do
      Item.create(name: "donut", description: "yummy", unit_price: "1000")
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      item = JSON.parse(response.body)

      item = item.last
      expect(item['name']).to eq("donut")
      expect(item['description']).to eq("yummy")
      expect(item['unit_price']).to eq("1000.0")
    end
  end

  context '#show' do
    it 'returns an item' do
      item = Item.create(name: "toy", description: "fun", unit_price: "1000")

      get :show, id: item.id, format: :json

      expect(response).to have_http_status(:ok)
      item = JSON.parse(response.body)

      expect(item['name']).to eq("toy")
      expect(item['description']).to eq("fun")
      expect(item['unit_price']).to eq("1000.0")
    end
  end
end
