class MealsController < ApplicationController
  def index
    @meals =Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    # @user = User.find(params[:user_id])
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    if @meal.save
      flash[:notice] = "You have succesfully created a meal."
      redirect_to meals_path
    else
      render 'new'
    end
  end

  # def order
  #   @meal = Meal.find(params[:meal_id])
  #   @user = User.find(params[:user_id])
  #   @order = Order.find_or_create_by(user: current_user, meal: @meal)

  #   if @order.save
  #     @meal.portion -= 1
  #     flash[:notice] = "You have successfully made an order."
  #     redirect_to order_path
  #   end
  # end

  private

    def meal_params
      params.require(:meal).permit(:name, :description, :price, :portion)
    end
end
