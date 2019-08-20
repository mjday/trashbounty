class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_one :review
  has_many :collection_recyclables, dependent: :destroy
  has_many :recycables, through: :collection_recyclables
end
