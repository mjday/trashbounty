class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :help]

  def home
    # may not need this
    @banks = Bank.all
    @markers = @banks.map do |bank|
      {
        lat: bank.latitude,
        lng: bank.longitude,
        infoWindow: render_to_string(partial: "map_info_window", locals: { bank: bank }),
        image_url: helpers.asset_url('trashbounty-logo.png')
      }
    end
  end

  def help
    #
  end

  def leaderboard
    @users = User.all
  end
end
