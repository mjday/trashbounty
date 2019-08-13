class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :recycables, through: :order_recyclables
end
