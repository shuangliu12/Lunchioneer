class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :kitchen_id, null: false
      t.integer :user_id, null: false
      t.string :body, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
