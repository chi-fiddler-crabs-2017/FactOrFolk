get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/show'
end

post '/questions' do 
	 @question = Question.new(title: params[:title], body: params[:body], user_id: current_user.id)

	 current_user.questions << @question


  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Wrong input for question. Try again."]
    redirect :'/'
  end
end 

post '/questions/:id/answer' do
  @question = Question.find(params[:id])
  @answer = Answer.new(user_id: current_user.id, text: params[:text])
  @question.answers << @answer
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end
