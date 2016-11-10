class RecipesUser < ActiveRecord::Base
  validates_presence_of   :user_id, :recipe_id
  validates_uniqueness_of :user_id, :recipe_id

  belongs_to :recipe
  belongs_to :user
end
