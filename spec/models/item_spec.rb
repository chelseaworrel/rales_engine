require 'rails_helper'

describe Item, type: :model do
  let(:customer_attributes) do
    {first_name: "Horace",
     last_name: "Williams",
     created_at: "21015-07-29 10:26:55",
     updated_at: "21015-07-29 10:26:55"}
  end

  let(:merchant_attributes) do
    {name: "Patigonia",
     created_at: "21015-07-29 10:26:55",
     updated_at: "21015-07-29 10:26:55"}
  end

  let(:invoice_attributes) do
    {customer_id: customer.id,
     merchant_id: merchant.id,
     status: "shipped",
     created_at: "21015-07-29 10:26:55",
     updated_at: "21015-07-29 10:26:55"}
  end

  let(:item_attributes) do
    {name: "Shirt",
     description: "floral print",
     unit_price: 10,
     created_at: "21015-07-29 10:26:55",
     updated_at: "21015-07-29 10:26:55",
     merchant_id: merchant.id
    }
  end

  let(:invoice_item_attributes) do
    {item_id: item.id,
     invoice_id: invoice.id,
     quantity: 5,
     unit_price: 10,
     created_at: "21015-07-29 10:26:55",
     updated_at: "21015-07-29 10:26:55"}
  end

  let(:invoice)      { Invoice.create(invoice_attributes)  }
  let(:merchant)     { Merchant.create(merchant_attributes)}
  let(:item)         { Item.create(item_attributes)        }
  let(:customer)     { Customer.create(customer_attributes)}
  let(:invoice_item) { InvoiceItem.create(invoice_item_attributes)}

  it 'responds to invoice items' do
    expect(item).to respond_to(:invoice_items)
  end

  it 'responds to merchant' do
    expect(item).to respond_to(:merchant)
  end

  it 'should have many invoice items' do
    invoice_item
    expect(item.invoice_items.include?(invoice_item)).to be(true)
    expect(item.invoice_items.count).to eq(1)
  end

  it 'should belong to a merchant' do
    expect(item.merchant).to eq(merchant)
  end
end
