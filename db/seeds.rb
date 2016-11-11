# users = 20.times.map do
#   User.create!( :username  => Faker::Internet.user_name,
#                 :email      => Faker::Internet.email,
#                 :password   => 'password' )
# end

# create basic ingredients in database
raw_ingredients = ['bread flour', 'all purpose flour',
                   'whole wheat flour', 'whole rye flour', 'water', 'salt', 'yeast', 'olive oil','spelt flour', 'honey', 'milk', 'wheat germ', 'high gluten flour',
                   'mature starter']

raw_ingredients.map do |ingredient|
  Ingredient.create!(name: ingredient)
end

recipe_procecees = <<-PROCESS
1. Mix starter, and ferment until mature.
2. Add all ingredients, including starter, until supple with some gluten development. Desired dough temperature: 76 degrees F.
3. Bulk fermentation.
4. Folding--fold as necessary do develop gluten.
5. Divide and shape as desired.
6. Final fermentation--1 to 1.5 hours at 76 degrees F, or alternately can be retarded overnight/12 hrs in the fridge.
7. Bake--With normal steam, 475 degrees for about 25 mins (for baguettes), or lower temp to 440 and vent steam for larger loaves--bake until done.
PROCESS

recipe_args = [ {title: 'Baguettes with Poolish', description: 'Standard baguette formula with a wet preferment', process: recipe_procecees}, {title: 'Ciabatta with Poolish', description: 'Standard ciabatta formula with a wet preferment', process: recipe_procecees}, {title: 'Pain de Campagne(sourdough)', description: 'Rustic bread with sourdough starter', process: recipe_procecees} ]

recipes = recipe_args.map do |args|
  Recipe.create!(title: args[:title], description: args[:description], process: args[:process])
end

recipes[0].ingredients_recipes.create!(ingredient_id: 1, quantity: 907)
recipes[0].ingredients_recipes.create!(ingredient_id: 5, quantity: 600)
recipes[0].ingredients_recipes.create!(ingredient_id: 6, quantity: 17)
recipes[0].ingredients_recipes.create!(ingredient_id: 7, quantity: 3)

recipes[1].ingredients_recipes.create!(ingredient_id: 1, quantity: 907)
recipes[1].ingredients_recipes.create!(ingredient_id: 5, quantity: 662)
recipes[1].ingredients_recipes.create!(ingredient_id: 6, quantity: 17)
recipes[1].ingredients_recipes.create!(ingredient_id: 7, quantity: 3)

recipes[2].ingredients_recipes.create!(ingredient_id: 14, quantity: 30)
recipes[2].ingredients_recipes.create!(ingredient_id: 3, quantity: 20)
recipes[2].ingredients_recipes.create!(ingredient_id: 6, quantity: 10)
recipes[2].ingredients_recipes.create!(ingredient_id: 4, quantity: 115)
recipes[2].ingredients_recipes.create!(ingredient_id: 5, quantity: 435)
recipes[2].ingredients_recipes.create!(ingredient_id: 1, quantity: 450)
