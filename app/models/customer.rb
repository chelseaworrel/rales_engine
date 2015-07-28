class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.max_by { |c| c.invoices.successful.where(customer_id: id).count }
  end
end
