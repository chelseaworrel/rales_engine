require 'rails_helper'

describe Invoice, type: :model do
  let(:customer_attributes) do
    {first_name: "Morgan",
     last_name: "Miller",
     created_at: "2015-07-29 10:22:33",
     updated_at: "2015-07-29 10:22:33"}
  end

  let(:merchant_attributes) do
    {name: "K-mart",
     created_at: "2015-07-29 10:22:33",
     updated_at: "2015-07-29 10:22:33"}
  end

  let(:invoice_attributes) do
    {customer_id: customer.id,
     merchant_id: merchant.id,
     status: "shipped",
     created_at: "2015-07-29 10:22:33",
     updated_at: "2015-07-29 10:22:33"}
  end

  let(:item_attributes) do
    {name: "Soap",
     description: "it gets you clean",
     unit_price: 10,
     created_at: "2015-07-29 10:22:33",
     updated_at: "2015-07-29 10:22:33",
     merchant_id: merchant.id
    }
  end

  let(:invoice_item_attributes) do
    {item_id: item.id,
     invoice_id: invoice.id,
     quantity: 5,
     unit_price: 10,
     created_at: "2015-07-29 10:22:33",
     updated_at: "2015-07-29 10:22:33"}
  end

  let(:transaction_attributes) do
    {invoice_id: invoice.id,
     credit_card_number: "4140149827486249",
     result: "success",
     created_at: "2015-07-29 10:22:33",
     updated_at: "2015-07-29 10:22:33"}
  end



  let(:invoice)      { Invoice.create(invoice_attributes)         }
  let(:customer)     { Customer.create(customer_attributes)       }
  let(:merchant)     { Merchant.create(merchant_attributes)       }
  let(:item)         { Item.create(item_attributes)               }
  let(:invoice_item) { InvoiceItem.create(invoice_item_attributes)}
  let(:transaction)  { Transaction.create(transaction_attributes) }

  it 'should respond to all other models' do
    expect(invoice).to respond_to(:transactions)
    expect(invoice).to respond_to(:invoice_items)
    expect(invoice).to respond_to(:items)
    expect(invoice).to respond_to(:customer)
    expect(invoice).to respond_to(:merchant)
  end

  it 'should have transactions' do
    expect(invoice.transactions.include?(transaction)).to be(true)
    expect(invoice.transactions.count).to be(1)
  end

  it 'should have invoice_items' do
    invoice_item
    expect(invoice.invoice_items.include?(invoice_item)).to be(true)
    expect(invoice.invoice_items.count).to eq(1)
  end

  it 'should have items' do
    item
    invoice_item
    expect(invoice.items.include?(item)).to be(true)
    expect(invoice.items.count).to be(1)
  end

  it 'should have a customer' do
    expect(invoice.customer).to eq(customer)
  end

  it 'should have a merchant' do
    expect(invoice.merchant).to eq(merchant)
  end
end
