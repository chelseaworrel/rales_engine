class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items

  def most_revenue(quantity)
    # Item.joins(:invoices).merge(Invoice.successful).group(:name).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"').sort_by(&:last).reverse.take(3).map {|n, _| Item.find_by(name: n)}
  end
end
