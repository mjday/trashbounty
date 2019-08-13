class OrderRecyclable < ApplicationRecord
  belongs_to :order
  belongs_to :recyclable
end
