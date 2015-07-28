class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.max_by { |m| m.transactions.where(result: "success").count }
  end
end
