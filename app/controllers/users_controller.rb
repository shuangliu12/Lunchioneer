class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @orders = @user.orders.order("created_at DESC")
    @meals = Meal.where(user: @user).order("created_at DESC")
    @reviews = @user.reviews.order("created_at DESC")
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You have successfully updated your profile picture."
      redirect_to user_path(@user)
    # else
    #   flash[:alert] = "You need to submit a photo."
    #   render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_photo, :email)
  end
end
