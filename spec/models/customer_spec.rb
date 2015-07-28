# require 'rails_helper'
#
# RSpec.describe Customer, type: :model do
#   test "a customer has invoices" do
#     customer = Customer.create(first_name: "Chelsea", last_name: "May")
#     customer_invoice = customer.invoices.create(status: "shipped")
#     assert 1, customer.invoices.count
#   end
#
#   test "a customer has transactions through invoices" do
#     customer = Customer.create(first_name: "Chelsea", last_name: "May")
#     customer_invoice = customer.invoices.create(status: "shipped")
#     transactions = customer_invoice.transactions.create(credit_card_number: "4654405418249632", result: "success")
#     assert 1, customer.transactions.count
#   end
#
#   test "customer has mechants through invioces" do
#
#   end
# end
