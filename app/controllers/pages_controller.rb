class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :help]

  def home
    # may not need this
    @banks = Bank.all
  end

  def help
    #
  end

  def leaderboard
    @users = User.all

    # @user = current_user
    # @collections = Collection.where(user: @user)
    # @banks = Bank.where(user: @user)
    # @sum = get_total_kg

  end
end
