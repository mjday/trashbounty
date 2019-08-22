class Bank < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  # added optional true to allow me to test banks in the terminal
  has_many :collections
  has_many :reviews, through: :collections
  has_many :recyclables, through: :banks_recyclables
  has_many :plastics

  validates :name, :address, :phone_number, :website, presence: true
  validates :products_accepted, presence: true
  # validates :materials_accepted, presence: true, inclusion: { in: ["ABS", "HDPE", "HIPS", "LDPE", "LLDPE", "PA", "PC", "PE", "PET", "PP", "PS", "PVC", "WastePlastic"] }

  def average_rating
    rating_array = self.reviews.pluck(:rating)
    sum = rating_array.reduce(:+)
    return nil if !sum
    sum /= rating_array.count
    return sum.round(2)
  end

  def average_price
    price_array = self.plastics.pluck(:price_per_kg)
    sum = price_array.reduce(:+)
    return nil if !sum
    sum /= price_array.count
    return sum.round(2)
  end
end
