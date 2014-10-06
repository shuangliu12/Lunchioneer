class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def create
    @user = User.find(params[:user_id])
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    if @meal.save
      flash[:notice] = "You have succesfully created a meal."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def meal_params
      params.require(:meal).permit(:name, :description, :price, :portion)
    end
end
