class Collection < ApplicationRecord
  # belongs_to :user
  belongs_to :bank
  has_many :recycables, through: :collection_recyclables
end
