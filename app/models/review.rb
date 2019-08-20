class Review < ApplicationRecord
  belongs_to :collection
  belongs_to :user
  # belongs_to :bank, optional: true
  validates :rating, presence: true
end
