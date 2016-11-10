class Ingredient < ActiveRecord::Base
  validates_presence_of   :name
  validates_uniqueness_of :name

  has_many :ingredients_recipes
  # belongs_to :recipe, through: :ingredients_recipes
end
