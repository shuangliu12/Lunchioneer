class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @user = User.find(params[:user_id])
    @meal = Meal.find(params[:meal_id])
  end
end
