helpers do

  def current_question
    @question = Question.find(params[:question_id])
  end
end
