class Verification < ApplicationRecord
  belongs_to :bank
  has_many :collected_plastics
  # belongs_to :plastic

  accepts_nested_attributes_for :collected_plastics
end
