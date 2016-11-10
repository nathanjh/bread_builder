class IngredientsRecipe < ActiveRecord::Base
  validates_presence_of   :recipe_id, :ingredient_id
  # validates_uniqueness_of :recipe_id, :ingredient_id
  validates :quantity, numericality: true

  belongs_to :ingredient
  belongs_to :recipe
end
