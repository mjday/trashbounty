class OrderRecyclable < ApplicationRecord
  belongs_to :collection
  belongs_to :recyclable
end
