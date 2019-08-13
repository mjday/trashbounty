class BankRecyclable < ApplicationRecord
  belongs_to :bank
  belongs_to :recyclable
end
