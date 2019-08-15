class CollectionsController < ApplicationController
  before_action :set_collection, only: [:create]

  def index
    if !current_user.business
      @collections = Collection.all
    else
      redirect_back fallback_location: root_path
    end

    # only the current user should be able to see the collection history
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
    @bank = Bank.find(params[:bank_id])
    @collection.bank_id = @bank.id

    if @collection.save
      redirect_to users_dashboard_path
    else
      render 'new'
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:date, :total_kg, :total_amount, :payment_type)
  end
end
