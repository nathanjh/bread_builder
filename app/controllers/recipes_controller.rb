# return recipe search results
get '/recipes' do
  @recipes = Recipe.where('lower(title) LIKE (?)', "%#{params[:query]}%")

  if request.xhr?
    erb :'/recipes/partials/_search_results.html', layout: false, locals: { recipes: @recipes }
  else
    erb :'/index.html'
  end
end
