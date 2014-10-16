class CreateSearchView < ActiveRecord::Migration
  def up
    execute %{
      CREATE VIEW searches AS
        (SELECT meals.meal_date AS date,
  kitchens.city AS location FROM meals JOIN kitchens ON meals.user_id = kitchens.user_id)
    }
  end

  def down
    execute "drop view searches"
  end

end
