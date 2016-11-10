class Recipe < ActiveRecord::Base
  validates_presence_of :title, :description, :process
  validates_uniqueness_of :title, case_sensitive: false

  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  has_many :recipes_users
  # belongs_to :user, through: :recipes_users
end
