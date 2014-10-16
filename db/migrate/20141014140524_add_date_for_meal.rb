class AddDateForMeal < ActiveRecord::Migration
  def change
    add_column :meals, :meal_date, :date, null: false
  end
end
