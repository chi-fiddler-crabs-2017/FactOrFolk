get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/show'
end

post '/questions/:id/answer' do
  @question = Question.find(params[:id])
  @answer = Answer.new(user_id: current_user.id, text: params[:text])
  @question.answers << @answer
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    # @answers = @question.answers
    @errors = @answer.errors.full_messages
    # @error = ["You can't not answer this question."]
    # redirect "/questions/#{@question.id}"
    erb :'questions/show'
  end
end
