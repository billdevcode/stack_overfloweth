before do
  @user = true if session[:user_id]
end

get '/' do
  @questions = []
  erb :index
end

post '/questions' do
  p params
  redirect '/'
end


post '/login' do
  @user = User.authenticate(params["user"])
  if @user
    login(@user)
    redirect '/'
  else
    redirect '/'
  end
end

post '/users' do
  @user = User.new(params['user'])
  if @user.save
    login(@user)
    redirect '/'
  else
    redirect '/signup'
  end
end

get '/logout' do
  logout!
  redirect '/'
end
