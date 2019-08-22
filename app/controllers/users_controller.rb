class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @collections = Collection.where(user: @user).order('date asc')
    @verifications = Collection.where(bank_id: @user.bank.id) if @user.business
    users = User.joins(:collections).group('users.id').select("users.id AS id, users.username AS name, SUM(collections.total_kg) as tot_kg").order("tot_kg DESC")
    @current_user_ranking = (users.each_with_index.select { |x| x[0].id == @user.id }[0][1]) + 1
    @banks = Bank.where(user: @user)
    @sum = get_total_kg
    @cash = cash_total
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
