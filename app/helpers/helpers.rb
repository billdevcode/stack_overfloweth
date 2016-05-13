use Rack::Session::Pool, :expire_after => 2592000

helpers do

  def current_user
    @user = User.find(params[:user_id])
  end

  def current_question
    @question = Question.find(params[:question_id])
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout!
    session[:user_id] = nil
  end

  def logged_in?
    current_user
  end

end
