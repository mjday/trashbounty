class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @collection = Collection.find(params[:collection_id])
  end

  def create
    @review = Review.new(reviews_params)
    @collection = Collection.find(params[:collection_id])
    @review.collection = @collection
    if @review.save
      redirect_to bank_path(@collection.bank)
    else
      render 'collections/index'
    end

  end

  private

  def reviews_params
    params.require(:review).permit(:rating)
  end
end
