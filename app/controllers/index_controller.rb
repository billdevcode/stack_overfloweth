before do
  @user = true if session[:user_id]
end


post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end

post '/new' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/new'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
