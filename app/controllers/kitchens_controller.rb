class KitchensController < ApplicationController
  # def index
  #   @kitchens = Kitchen.includes(:user)
  # end

  def show
    @kitchen = Kitchen.find(params[:user_id])
  end

  # def new
  #   @kitchen = Kitchen.new
  #   @user = @kitchen.user
  # end

  # def edit
  #   @kitchen = Kitchen.find(params[:id])
  # end

  # def update
  #   @kitchen = Kitchen.find(params[:id])

  #   if @kitchen.update(kitchen_params)
  #     flash[:notice] = "You have successfully updated your kitchen profile."
  #     redirect_to kitchen_path(@kitchen)
  #   else
  #     flash[:notice] = "You need to fill out the required fields."
  #     render 'show'
  #   end
  # end

   def create
    @user = User.find(params[:user_id])
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.user = current_user
    @kitchen.user_id = params[:user_id]

    if @kitchen.save
      flash[:notice] = "You have successfully updated your kitchen profile."
      redirect_to kitchen_path(@kitchen)
    else
      flash[:notice] = "You need to fill out the required fields."
      render 'new'
    end
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:kitchen_photo, :user_id, :name, :description,
      :address, :city, :state, :zipcode)
  end
end
