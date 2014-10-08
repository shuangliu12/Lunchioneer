class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.includes(:user)
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  def new
    @kitchen = Kitchen.new
    @user = User.find(params[:user_id])
    # @kitchen.user = current_user
    @kitchen.user = @user
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @user = User.find(params[:user_id])
    # @kitchen.user = current_user
    @kitchen.user_id = @user.id

      if @kitchen.save
        flash[:notice] = "You have successfully created your kitchen."
        redirect_to user_kitchen_path(@user, @kitchen)
      else
        flash[:notice] = "You need to fill out the required fields."
        render 'new'
      end
    end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    if @kitchen.update(kitchen_params)
      flash[:notice] = "You have successfully updated your kitchen profile."
      redirect_to user_kitchen_path(@kitchen.user, @kitchen)
    else
      flash[:notice] = "You need to fill out the required fields."
      render 'show'
    end
  end

    def destroy
      @kitchen = Kitchen.find(params[:id])
      @kitchen.destroy
        flash[:success] = "You have successfully deleted your kitchen."
      redirect_to user_path(@kitchen.user)
    end

  private

  def kitchen_params
    params.require(:kitchen).permit(:kitchen_photo, :user_id, :name, :description,
      :address, :city, :state, :zipcode)
  end
end
