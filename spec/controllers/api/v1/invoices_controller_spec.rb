require 'rails_helper'

describe Api::V1::InvoicesController do
  context '#index' do
    it 'returns all the invoices' do
      Invoice.create(status: "shipped")
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      invoice = JSON.parse(response.body)

      invoice = invoice.last
      expect(invoice['status']).to eq("shipped")
    end
  end

  context '#show' do
    it 'returns an invoice' do
      invoice = Invoice.create(status: "shipped")

      get :show, id: invoice.id, format: :json

      expect(response).to have_http_status(:ok)
      invoice = JSON.parse(response.body)

      expect(invoice['status']).to eq("shipped")
    end
  end
end
