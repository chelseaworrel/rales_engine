require 'rails_helper'

describe Api::V1::TransactionsController do
  context '#index' do
    it 'returns all of the transactions' do
      Transaction.create(credit_card_number: "4140149827486249", result: "success")
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      transaction = JSON.parse(response.body)

      transaction = transaction.last
      expect(transaction['credit_card_number']).to eq("4140149827486249")
      expect(transaction['result']).to eq("success")
    end
  end

  context '#show' do
    it 'returns an transaction' do
      transaction = Transaction.create(credit_card_number: "4140149827486249", result: "success")

      get :show, id: transaction.id, format: :json

      expect(response).to have_http_status(:ok)
      transaction = JSON.parse(response.body)

      expect(transaction['credit_card_number']).to eq("4140149827486249")
      expect(transaction['result']).to eq("success")
    end
  end
end
