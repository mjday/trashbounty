class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # root page
  def home
    @banks = Bank.all
  end

  # help page
  def help
    #
  end
end
