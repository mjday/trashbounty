class Bank < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :reviews, through: :collections
  has_many :recyclables, through: :banks_recyclables
end
