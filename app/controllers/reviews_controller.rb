class ReviewsController < ApplicationController
  before_action :authorize_user!, only: [:new, :create, :edit, :update, :destroy]

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
    else
      flash[:notice] = "Please fill out the review form correctly."
    end
    redirect_to user_kitchen_path(@kitchen.user, @kitchen)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @kitchen = Kitchen.find(params[:kitchen_id])
    @review.user = current_user
    @review.kitchen_id = params[:kitchen_id]

    if @review.update(review_params)
      flash[:sucess] = "You have successfully updated your review."
      redirect_to user_kitchen_path(@kitchen.user, @kitchen)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @kitchen = Kitchen.find(params[:kitchen_id])
    @review.user = current_user
    @review.kitchen_id = params[:kitchen_id]
    @review.destroy
      flash[:success] = "You have successfully deleted your review."
    redirect_to user_kitchen_path(@kitchen.user, @kitchen)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
