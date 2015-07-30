require 'rails_helper'

describe Api::V1::MerchantsController do
  context '#index' do
    it 'returns all the merchants' do
      Merchant.create(name: 'Target')

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      merchant = JSON.parse(response.body)

      merchant = merchant.last

      expect(merchant['name']).to eq('Target')
    end
  end

  context '#show' do
    it 'returns a merchant' do
      merchant = Merchant.create(name: 'Patagonia')

      get :show, id: merchant.id, format: :json

      expect(response).to have_http_status(:ok)
      merchant = JSON.parse(response.body)

      expect(merchant['name']).to eq('Patagonia')
    end
  end
end
