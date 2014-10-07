class CreateKitchen < ActiveRecord::Migration
  def change
    create_table :kitchens do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.string :description, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :kitchen_photo

      t.timestamp
    end
  end
end
