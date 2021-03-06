class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :collections
  has_one :bank
  has_many :reviews, through: :collections
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_crypto_data
    BlockIo.set_options api_key: ENV['BLOCK_IO_API_KEY'], pin: ENV['BLOCK_IO_PIN'], version: 2
    address = self.bitcoin_address
    response = BlockIo.get_transactions :type => 'received', :addresses => address
    # this works because it the specific current address had 1 tx only
    tx = response["data"]["txs"][0]

    arr = []
    if tx.nil?
      return nil
    else
      arr << transaction = tx["txid"]
      arr << amount = tx["amounts_received"][0]["amount"]
      arr << recipient = tx["amounts_received"][0]["recipient"]
      arr << sender = tx["senders"][0]
      arr << conf = tx["confirmations"]
      return arr
    end

  end
end



