class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @collections = Collection.where(user: @user).order('date asc')
    # raise
    # @sorted_collections = @collections.orde
    @banks = Bank.where(user: @user)
    @sum = get_total_kg
    # raise
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
