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
      redirect_to meal_order_path(@meal, @order)
    else

    end
  end
end
