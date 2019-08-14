class Bank < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user, optional: true
  # added optional true to allow me to test banks in the terminal
  has_many :collections
  has_many :reviews, through: :collections
  has_many :recyclables, through: :banks_recyclables
end
