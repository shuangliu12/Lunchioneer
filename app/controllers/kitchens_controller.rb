class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.includes(:user)
  end

  def show
    @kitchen = Kitchen.find(params[:user_id])
  end

  def new
    @kitchen = Kitchen.new
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])

    if @kitchen.update(kitchen_params)
      flash[:notice] = "You have successfully updated your kitchen profile."
      redirect_to kitchen_path(@kitchen)
    else
      flash[:notice] = "You need to fill out the required fields."
      render 'show'
    end
  end

   def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.user = current_user

    if @kitchen.save
      flash[:notice] = "You have successfully created your kitchen."
      redirect_to kitchens_path
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
