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
    @sum = total_kg
  end

  def help
    #
  end

  def leaderboard
    # @total = sum
    # @collections = Collection.all
    @users = User.joins(:collections).group('users.id').select("users.username AS name, SUM(collections.total_kg) as tot_kg").order("tot_kg DESC")
    # @users = User.all
    @sum = total_kg
  end

  def total_kg
    @collections = Collection.all
    sum = 0.0
    @collections.each do |collection|
      sum += collection.total_kg
    end
      sum
    end

def sum
  # raise
end



    # def total_per_user
    # #   @collections = Collection.all
    # # @collections = Collection.all
    # # @collections.each do |collection|
    # #   user.collections.map(&:total_kg)
    #   # .collections = @collections
    # #   # raise
    # #   @collections.each do |collection|
    # #     collection.user_id
    # end
    # end

end
