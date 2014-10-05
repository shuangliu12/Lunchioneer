class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @kitchen = kitchen.new
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You have successfully updated your profile picture."
      redirect_to user_path(@user)
    else
      flash[:alert] = "You need to submit a photo."
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_photo, :email)
  end
end
