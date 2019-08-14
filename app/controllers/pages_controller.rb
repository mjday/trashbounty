class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @banks = Bank.all
  end
end
