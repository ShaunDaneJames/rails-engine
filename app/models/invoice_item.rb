class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  has_many :transactions, through: :invoice

  validates_presence_of :item
  validates_presence_of :invoice
  validates_presence_of :quantity
  validates_presence_of :unit_price
end
