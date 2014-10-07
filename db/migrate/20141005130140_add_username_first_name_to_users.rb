class AddUsernameFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo, :string
    add_column :users, :username, :string, null: false
    add_column :users, :first_name, :string, null: false
  end
end
