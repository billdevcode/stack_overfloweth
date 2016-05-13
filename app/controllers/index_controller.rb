before do
  @user = true if session[:user_id]
end

get '/' do
  @questions = Question.all
  erb :index
end

post '/questions' do
  p params
  redirect '/'
end


post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect '/'
  else
    redirect '/login'
  end
end

post '/signup' do
  @user = User.new(params[:user])
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
