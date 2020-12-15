class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  validates_presence_of :customer_id
  validates_presence_of :merchant_id
  validates_presence_of :status
end
