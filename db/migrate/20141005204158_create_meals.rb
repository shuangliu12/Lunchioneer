class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.string :description
      t.integer :price, null: false
      t.integer :portion, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
