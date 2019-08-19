class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @collections = Collection.where(user: @user)
    @banks = Bank.where(user: @user)
    # raise
  end

  def get_total_kg
    @user = current_user
    @collections = Collection.where(user: @user)

    sum = 0.0
    @user.collections.each do |collection|
      sum += collection.total_kg
      @collections.sum = sum
    end
  end
end
