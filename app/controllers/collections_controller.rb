class CollectionsController < ApplicationController
  # before_action :set_collection, only: [:create]

  def index
    @collections = Collection.all
  end

  def new
    if current_user.business
      redirect_to root_path
      flash[:warning] = 'You are not allowed'
    end
    @collection = Collection.new(total_kg: params[:total_kg],
                                 total_amount: params[:total_amount],
                                 date: Date.now,
                                 payment_type: params[:payment_type])
    # raise
  end

  def create
    # @collection = Collection.new(params)
    # render plain: params.to_json

    # Collection.new(collection_params)
    # @collection.user_id = current_user.id
    # @bank = Bank.find(params[:bank_id])
    # @collection.bank_id = @bank.id
    # if @collection.save
    #   redirect_to users_dashboard_path
    # else
    #   render 'new'
    # end
  end

  def transaction
    @collection = Collection.new
    redirect_to root_path unless current_user.business
  end

  def validate

  end

  private

  # def set_collection
  #   @collection = Collection.find(params[:id])
  # end

  # def collection_params
  #   params.require(:collection).permit(:date, :total_kg, :total_amount, :payment_type)
  # end
end
