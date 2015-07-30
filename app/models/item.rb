class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items

  def self.most_revenue(params)

  end


  def self.successful_invoice_items
    joins(:invoices).merge(Invoice.successful)
  end
end
