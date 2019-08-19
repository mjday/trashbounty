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
  end
end
