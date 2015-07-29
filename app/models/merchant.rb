class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def self.most_revenue(x)

  end

  def revenue(params)
    if params[:date]
      invoices.successful.where(invoices: {created_at: params[:date]}).joins(:invoice_items).sum('quantity * unit_price') / 100.00
    else
      invoices.successful.joins(:invoice_items).sum('quantity * unit_price') / 100.00
    end
  end

  def favorite_customer
    customers.max_by { |c| c.invoices.successful.where(merchant_id: id).count }
  end

  def customers_with_pending_invoices
    pending_invoices = invoices - invoices.successful
    pending_invoices.map { |invoice| invoice.customer }
  end
end
