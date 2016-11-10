class CreateRecipesUsers < ActiveRecord::Migration
  def change
    create_table :recipes_users do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :bake_description

      t.timestamps null: false
    end
  end
end
