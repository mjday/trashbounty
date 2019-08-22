class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  belongs_to :verification
  has_one :review, dependent: :destroy
  has_many :recycables, through: :collection_recyclables
  has_many :collected_plastics, through: :verifications
end
