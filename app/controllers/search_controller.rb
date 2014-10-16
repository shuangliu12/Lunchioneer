class SearchController < ActionController::Base
  def index
    @kitchens = Kitchen.where("city ilike ?", "%#{params[:q]}%")
    @meals = Meal.where("meal_date ilike ?", "%#{params[:date_search]}%")
  end
end
