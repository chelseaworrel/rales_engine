class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def fave_merch
    Merchants.order("count DESC").first
  end
end
