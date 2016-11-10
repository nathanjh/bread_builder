class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
