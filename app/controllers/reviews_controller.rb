class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @kitchen = Kitchen.find(params[:kitchen_id])
    @review.user = current_user
    @review.kitchen_id = params[:kitchen_id]

    if @review.save
      flash[:success] = "You have successfully created your review."
      redirect_to @kitchen
    else
      render "kitchen#show"
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
