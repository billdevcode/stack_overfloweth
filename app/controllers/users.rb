get '/' do
  erb :'index'
end

get '/users/new' do

  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user_info])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  # @decks = Deck.find_by(user_id: @user.id)
  if current_user == @user
    erb :'/users/show'
  else
    redirect '/'
  end
end
