class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @meal = Meal.find(params[:meal_id])

    @order = Order.new(meal: @meal, user: current_user)
    if @order.save
      @meal.portion -=1
      @meal.save
      flash[:notice]="You have successfully placed your order."
      redirect_to user_kitchen_path(@meal.user, @meal.user.kitchen)
    else

    end
  end
end
