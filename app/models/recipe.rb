class Recipe < ActiveRecord::Base
  validates_presence_of :title, :description, :process
  validates_uniqueness_of :title, case_sensitive: false

  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  has_many :recipes_users

  def bakers_formula
    names = self.ingredient_names
    quantities = self.ingredient_quantities
    formula = {}
    names.each_with_index do |name, idx|
      formula[name] = self.bakers_percentage(quantities[idx])
    end
    formula
  end

  def ingredient_list
    names = self.ingredient_names
    quantites = self.ingredient_quantities
    list = {}
    names.each_with_index do |name, idx|
      list[name] = quantites[idx]
    end
    list
  end

  private

  def total_flour
    flour_ingredients = self.ingredients.where('name LIKE (?)', '%flour%')
    weights = flour_ingredients.map do |ingredient|
      self.ingredients_recipes.find_by_ingredient_id(ingredient.id).quantity
    end
    weights.reduce(:+)
  end

  def bakers_percentage(quantity)
    ((quantity.to_f / self.total_flour) * 100).round(2)
  end

  def ingredient_names
    ingredients = self.ingredients_recipes
    ingredients.map do |ingredient|
      self.ingredients.find(ingredient.ingredient_id).name
    end
  end

  def ingredient_quantities
    self.ingredients_recipes.map(&:quantity)
  end
end
