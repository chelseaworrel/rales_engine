require 'rails_helper'

describe Transaction, type: :model do
  let(:customer_attributes) do
    {first_name: "Ashley",
     last_name: "May",
     created_at: "21015-07-29 10:32:45",
     updated_at: "21015-07-29 10:32:45"}
  end

  let(:merchant_attributes) do
    {name: "Party City",
     created_at: "21015-07-29 10:32:45",
     updated_at: "21015-07-29 10:32:45"}
  end

  let(:invoice_attributes) do
    {customer_id: customer.id,
     merchant_id: merchant.id,
     status: "shipped",
     created_at: "21015-07-29 10:32:45",
     updated_at: "21015-07-29 10:32:45"}
  end

  let(:transaction_attributes) do
    {invoice_id: invoice.id,
     credit_card_number: "4140149827486249",
     result: "success",
     created_at: "21015-07-29 10:32:45",
     updated_at: "21015-07-29 10:32:45"}
  end

  let(:invoice)     { Invoice.create(invoice_attributes)        }
  let(:customer)    { Customer.create(customer_attributes)      }
  let(:merchant)    { Merchant.create(merchant_attributes)      }
  let(:transaction) { Transaction.create(transaction_attributes)}

  it 'responds to invoice' do
    expect(transaction).to respond_to(:invoice)
  end

  it 'has an invoice' do
    expect(transaction.invoice).to eq(invoice)
  end
end
