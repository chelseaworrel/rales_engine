require 'rails_helper'

describe Api::V1::InvoiceItemsController do
  context '#index' do
    it 'returns all the invoice items' do
      invoice_item = InvoiceItem.create(quantity: 1, unit_price: 2.00)
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      invoice_item = JSON.parse(response.body)

      invoice_item = invoice_item.last

      expect(invoice_item['quantity']).to eq(1)
      expect(invoice_item['unit_price']).to eq("2.0")
    end
  end

  context '#show' do
    it 'returns an invoice item' do
      invoice_item = InvoiceItem.create(quantity: 1, unit_price: 100)

      get :show, id: invoice_item.id, format: :json

      expect(response).to have_http_status(:ok)
      invoice_item = JSON.parse(response.body)

      expect(invoice_item['quantity']).to eq(1)
      expect(invoice_item['unit_price']).to eq('100.0')
    end
  end
end
