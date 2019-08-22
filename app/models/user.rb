class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :collections
  has_many :banks
  has_many :reviews, through: :collections
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_crypto_data
    BlockIo.set_options api_key: ENV['BLOCK_IO_API_KEY'], pin: ENV['BLOCK_IO_PIN'], version: 2
    address = self.bitcoin_address
    response = BlockIo.get_transactions :type => 'received', :addresses => address
    # this works because it the specific current address had 1 tx only
    tx = response["data"]["txs"][0]

    return "No previous transactions" if tx.nil?

    # arr = []
    transaction = tx["txid"]
    amount = tx["amounts_received"][0]["amount"]
    recipient = tx["amounts_received"][0]["recipient"]
    sender = tx["senders"][0]

    # return arr

    # complete_tx = "TX Hash: #{transaction}" + "(Recycle Bank) #{sender} sent: " + "Amount: #{amount} to: " + "Recipient: #{recipient}"
    return "TX ID: #{transaction} #{amount} BTC - From (Recycle Bank): #{sender}  | To: #{recipient}  "

    # return {
    #   transaction: tx["txid"],
    #   recipient: tx["amounts_received"][0]["recipient"],
    #   amount: tx["amounts_received"][0]["amount"],
    #   sender: tx["senders"][0]
    # }

  end
end



