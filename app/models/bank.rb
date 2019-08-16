class Bank < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  # added optional true to allow me to test banks in the terminal
  has_many :collections
  has_many :reviews, through: :collections
  has_many :recyclables, through: :banks_recyclables

  validates :name, :address, :phone_number, :website, presence: true
  validates :materials_accepted, :products_accepted, presence: true
  # validates :materials_accepted, presence: true, inclusion: { in: ["ABS", "HDPE", "HIPS", "LDPE", "LLDPE", "PA", "PC", "PE", "PET", "PP", "PS", "PVC", "WastePlastic"] }
end
