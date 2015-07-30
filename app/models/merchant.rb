class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices


  def revenue(params)
    if params[:date]
      revenue_for_date(params)
    else
      calculate_revenue
    end
  end

  def favorite_customer
    customers.max_by { |c| c.invoices.successful.where(merchant_id: id).count }
  end

  def customers_with_pending_invoices
    pending_invoices = invoices - invoices.successful
    pending_invoices.map { |invoice| invoice.customer }
  end

  def self.most_revenue(params)
     all.max_by(params[:quantity].to_i) { |m| m.calculate_revenue }
  end

  def calculate_revenue
    invoices.successful.joins(:invoice_items).sum('quantity * unit_price')/100
  end

  def self.most_items(params)
    all.max_by(params[:quantity].to_i) { |m| m.total_items }
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

  def revenue_for_date(params)
    invoices.successful.where(invoices: {created_at: params[:date]}).joins(:invoice_items).sum('quantity * unit_price') / 100.00
  end

  def self.all_revenue(params)
    all.map { |m| m.revenue_for_date(params) }.reduce(:+)
    # Invoice.successful.where(invoices: {created_at: params[:date]}).joins(:invoice_items).sum('quantity * unit_price') / 100.00
  end

end
