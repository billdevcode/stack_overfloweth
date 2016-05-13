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


#RESPOND TO A QUESTION ROUTES
get '/questions/:id/responses/new' do
end

post '/questions/:id/responses' do
	@response = Response.new()
  @question = Question.find_by(id: params[:id])
  @question.responses << @response
  # @question.save DO WE NEED THIS?
  @response.save
  redirect "/questions/#{@question.id}"
end


#ANSWER A QUESTION ROUTES
get '/questions/:id/answers/new' do

end

post '/questions/:id/answers' do
	@answer = Answer.new()
  @question = Question.find_by(id: params[:id])
  @question.answers << @answer
  # @question.save DO WE NEED THIS?
  @answer.save
  redirect "/questions/#{@question.id}"
end


#RESPOND TO A QUESTION'S ANSWER ROUTES
get '/questions/:question_id/answers/:id/responses/new' do

end

post '/questions/:question_id/answers/:id/responses' do
  @response = Response.new()
  @answer = Answer.find_by(id: params[:id])
  @answer.responses << @response
  # @answer.save DO WE NEED THIS?
  @response.save
  @question = Question.find_by(id: params[:question_id])
  redirect "/questions/#{@question.id}"
end

post '/questions/:id/vote' do
  p params
  @question = Question.find_by(id: params[:id])
  @vote = Vote.create(user_id: @question.user_id, votable_id: @question.id)
  if request.xhr?
    if params[:data] == "upvote"
      @vote.up_vote = 1
      @vote.save
      p "=======" * 50
      p @question.up_vote_sum
      return @question.up_vote_sum.to_s
    elsif params[:data] == "downvote"
      @vote.down_vote = 1
      @vote.save
      return @question.down_vote_sum.to_s
    end
  else
    # redirect "/questions/#{params[:id]}/vote"
  end
end
