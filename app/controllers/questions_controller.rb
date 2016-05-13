#ASK A QUESTION ROUTES
get '/questions' do
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
	@question = Question.create(params[:questions])
  if request.xhr?
    erb :'questions/_new', layout: false
  else
    redirect '/'
  end
end

get '/questions/:id' do
	@question = Question.find_by(id: params[:id])
  @answers = @question.answers
  erb :'questions/show'
end


post '/questions/:id/responses' do
	@response = Response.new(user_id: session[:user_id], respondable_id: params[:id], respondable_type: "Question")
  @question = Question.find_by(id: params[:id])
  @question.responses << @response
  @response.save
  redirect "/questions/#{@question.id}"
end

post '/questions/:id/answers' do
	@answer = Answer.new(user_id: session[:user_id], question_id: params[:id])
  @question = Question.find_by(id: params[:id])
  @question.answers << @answer
  @answer.save
  redirect "/questions/#{@question.id}"
end

post '/questions/:question_id/answers/:id/responses' do
  @response = Response.new(user_id: session[:user_id], respondable_id: params[:id], respondable_type: "Answer")
  @answer = Answer.find_by(id: params[:id])
  @answer.responses << @response
  @response.save
  @question = Question.find_by(id: params[:question_id])
  redirect "/questions/#{@question.id}"
end

post '/questions/:id/vote' do
  @question = Question.find_by(id: params[:id])
  @vote = Vote.create(user_id: @question.user_id, votable_id: @question.id, votable_type: "Question")
  if request.xhr?
    if params[:data] == "upvote"
      @vote.up_vote = 1
      @vote.save
      return @question.up_vote_sum.to_s
    elsif params[:data] == "downvote"
      @vote.down_vote = 1
      @vote.save
      return @question.down_vote_sum.to_s
    end
  else
    redirect "/questions/#{params[:id]}/vote"
  end
end
