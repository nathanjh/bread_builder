get '/sessions/new' do
  erb :'sessions/new.html'
end

# set session id to user id if valid user
post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login
    redirect '/'
  else
    @errors = ['invalid credentials...please try again']
    erb :'sessions/new.html'
  end
end

# log out
delete '/sessions' do
  logout
  redirect '/'
end
