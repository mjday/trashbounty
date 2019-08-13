class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @collections = Collection.where(user: @user)
    @banks = Bank.where(user: @user)
    # raise
  end
end
