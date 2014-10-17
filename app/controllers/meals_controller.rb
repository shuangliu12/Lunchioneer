class MealsController < ApplicationController
  def index
    @meals = Meal.order('meal_date DESC').page params[:page]
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
      redirect_to user_kitchen_path(@meal.user, @meal.user.kitchen)
    else
      render 'new'
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      flash[:notice] = "You have successfully updated your meal."
    else
      flash[:notice] = "You need to fill out the required fields."
    end
    redirect_to user_kitchen_path(@meal.user, @meal.user.kitchen)
  end

    def destroy
      @meal = Meal.find(params[:id])
      @meal.destroy
        flash[:success] = "You have successfully deleted your meal."
      redirect_to user_kitchen_path(@meal.user, @meal.user.kitchen)
    end

  private

    def meal_params
      params.require(:meal).permit(:name, :description, :price, :portion, :meal_date)
    end
end
