require 'rails_helper'

describe InvoiceItem, type: :model do
  let(:customer_attributes) do
    {first_name: "Sally",
     last_name: "Mac",
     created_at: "21015-07-29 10:18:10",
     updated_at: "21015-07-29 10:18:10"}
  end

  let(:merchant_attributes) do
    {name: "Wal-Mart",
     created_at: "21015-07-29 10:18:10",
     updated_at: "21015-07-29 10:18:10"}
  end

  let(:invoice_attributes) do
    {customer_id: customer.id,
     merchant_id: merchant.id,
     status: "shipped",
     created_at: "21015-07-29 10:18:10",
     updated_at: "21015-07-29 10:18:10"}
  end

  let(:item_attributes) do
    {name: "Food",
     description: "very yummy food",
     unit_price: 10,
     created_at: "21015-07-29 10:18:10",
     updated_at: "21015-07-29 10:18:10",
     merchant_id: merchant.id
    }
  end

  let(:invoice_item_attributes) do
    {item_id: item.id,
     invoice_id: invoice.id,
     quantity: 5,
     unit_price: 10,
     created_at: "21015-07-29 10:18:10",
     updated_at: "21015-07-29 10:18:10"}
  end


  let(:invoice)  { Invoice.create(invoice_attributes)  }
  let(:customer) { Customer.create(customer_attributes)}
  let(:merchant) { Merchant.create(merchant_attributes)}
  let(:item)     { Item.create(item_attributes)        }
  let(:invoice_item) { InvoiceItem.create(invoice_item_attributes)}

  it 'responds to invoice' do
    expect(invoice_item).to respond_to(:invoice)
  end

  it 'responds to item' do
    expect(invoice_item).to respond_to(:item)
  end

  it 'should have an invoice' do
    expect(invoice_item.invoice).to eq(invoice)
  end

  it 'should have an item' do
    expect(invoice_item.item).to eq(item)
  end
end
