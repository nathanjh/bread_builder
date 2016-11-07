# show all users
get '/users/?' do
  @users = User.all
  erb :'/users/index.html'
end

# display a form for creating a new user
get '/users/new' do
  erb :'users/new.html'
end

# create a new user
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new.html'
  end
end

# display a user's profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show.html'
end

# display a user's profile page
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit.html'
end

# edit a user profile, must be logged in
put '/users/:id' do
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])
  if @user.save
    redirect '/users'
  else
    @errors = @user.errors.full_messages
    erb :'/users/edit.html'
  end
end

# delete a user
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  redirect '/users'
end
