class CollectionsController < ApplicationController
  # before_action :set_collection, only: [:create]

  def index
    if !current_user.business
      @collections = Collection.all
    else
      redirect_back fallback_location: root_path
    end

    # only the current user should be able to see the collection history
  end

  def show
    @collection = Collection.find(params[:id])
    @review = Review.new

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
    @collection = Collection.new(collection_params)
    @bank = Bank.find(params[:collection][:bank_id])

    verification = Verification.find(params[:collection][:verification_id])
    @collection.bank = @bank
    @collection.verification = verification
    @collection.user_id = current_user.id
    @collection.save
    redirect_to users_dashboard_path

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

  def collection_params
    params.require(:collection).permit(:date, :total_kg, :total_amount, :payment_type, :bank_id)
  end
end
