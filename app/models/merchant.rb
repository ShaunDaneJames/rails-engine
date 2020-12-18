class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :name

  def self.most_revenue(limit)
    select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("revenue DESC")
    .limit(limit)
  end

  def self.most_items_sold(limit)
    select("merchants.*, SUM(invoice_items.quantity) AS quantity")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("quantity DESC")
    .limit(limit)
  end
end
