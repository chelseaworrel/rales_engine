class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(x)

  end

  def revenue
    invoices.successful.joins(:invoice_items).sum('quantity * unit_price')/100
  end

  def favorite_customer
    customers.max_by { |c| c.invoices.successful.where(merchant_id: id).count }
    # invoices.successful.select('invoices.customer_id').group(:customer_id).count
  end
end
