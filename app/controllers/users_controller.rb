class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @collections = Collection.where(user: @user).order('date asc')

    @verifications = Collection.where(bank_id: @user.bank.id) if @user.business
    users = User.joins(:collections).group('users.id').select("users.id AS id, users.username AS name, SUM(collections.total_kg) as tot_kg").order("tot_kg DESC")
    # @current_user_ranking = (users.each_with_index.select { |x| x[0].id == @user.id }[0][1]) + 1 if @user.business == false
    users_list = users.each_with_index.select { |x| x[0].id == @user.id }
    unless users_list.empty?
      @current_user_ranking = users_list[0][1] + 1
    end
    # @current_user_ranking = (users.each_with_index.select { |x| x[0].id == @user.id }[0][1]) + 1 if @current_user_ranking !=nil

    #  this could be improved for stability with @current_user.collections !=nil


    @bank = Bank.where(user: @user).first
    @sum = get_total_kg
    @cash = cash_total
    @crypto_datas = @user.get_crypto_data

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

    def cash_total
    @user = current_user
    @collections = Collection.where(user: @user)
    sum = 0.0
    @user.collections.each do |collection|
      sum += collection.total_amount
    end
    sum
  end

  def camera
    @user = current_user
  end

end
