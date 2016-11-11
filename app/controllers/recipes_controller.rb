# return recipe search results
get '/recipes' do
  @recipes = Recipe.where('lower(title) LIKE (?)', "%#{params[:query]}%")

  if request.xhr?
    erb :'/recipes/partials/_search_results.html', layout: false, locals: { recipes: @recipes }
  else
    erb :'/index.html'
  end
end

# return a show page for recipe
get '/recipes/:id' do
  @user = current_user
  @recipe = Recipe.find(params[:id])
  @ingredients = @recipe.ingredients_recipes # array of ingredient-recipe relational objects
  @bakers_formula = @recipe.bakers_formula # hash of ingredient names/percentages
  erb :'/recipes/show.html'
end
