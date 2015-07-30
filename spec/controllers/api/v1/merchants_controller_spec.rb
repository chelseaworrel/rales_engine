require 'rails_helper'

describe Api::V1::MerchantsController do
  context '#index' do
    it 'returns all the customers' do
      Customer.create(first_name: 'Chelsea', last_name: 'May')

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      customer = JSON.parse(response.body)

      customer = customer.last

      expect(customer['first_name']).to eq('Chelsea')
      expect(customer['last_name']).to eq('May')
    end
  end

  context '#show' do
    it 'returns a customer' do
      customer = Customer.create(first_name: 'Chelsea', last_name: 'May')

      get :show, id: customer.id, format: :json

      expect(response).to have_http_status(:ok)
      customer = JSON.parse(response.body)

      expect(customer['first_name']).to eq('Chelsea')
      expect(customer['last_name']).to eq('May')
    end
  end
end
