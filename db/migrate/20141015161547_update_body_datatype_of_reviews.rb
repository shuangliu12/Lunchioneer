class UpdateBodyDatatypeOfReviews < ActiveRecord::Migration
  def self.up
    change_column :reviews, :body, :text
  end

  def self.down
    change_column :reviews, :body, :string
  end
end
