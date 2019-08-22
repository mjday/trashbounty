class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @collections = Collection.where(user: @user).order('date asc')
    @crypto_datas = @user.get_crypto_data
    @banks = Bank.where(user: @user)
    @sum = get_total_kg
    @verification = Verification.where(user: @user)


    # when user signs up, if they don't already have a Bitcoin address, this breaks
    # bitcoin_address: nil
    return @qr = RQRCode::QRCode.new(@user.bitcoin_address, size: 4, level: :h) if @user.bitcoin_address != nil
  end

  def get_total_kg
    @user = current_user
    @collections = Collection.where(user: @user)
    sum = 0.0
    @user.collections.each do |collection|
      sum += collection.total_kg
    end
    sum
  end

  def camera
    @user = current_user
  end

end
