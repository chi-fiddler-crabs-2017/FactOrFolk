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
  @answer = Answer.new(user: current_user, text: params[:text])
  @question.answers << @answer
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Something went wrong with your answer submission. Try again."]
    # redirect "/questions/#{@question.id}"
    erb :"questions/show"
  end
end
