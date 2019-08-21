class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @collections = Collection.where(user: @user).order('date asc')
    # raise
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
