class Verification < ApplicationRecord
  belongs_to :bank
  has_many :collected_plastics
  # belongs_to :plastic

  accepts_nested_attributes_for :collected_plastics

  def btc_price
    BlockIo.set_options api_key: ENV['BLOCK_IO_API_KEY_2'], pin: ENV['BLOCK_IO_PIN'], version: 2
    BlockIo.get_current_price :price_base => 'USD'
    result = BlockIo.get_current_price
    price = result["data"]["prices"][0]["price"]
    current_price = price.to_i
    return current_price
  end
end
