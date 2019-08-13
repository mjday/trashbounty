class Bank < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :reviews, through: :orders
  has_many :recyclables, through: :banks_recyclables
end
