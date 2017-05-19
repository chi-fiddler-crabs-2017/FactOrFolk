get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/show'
end

post '/comments' do
  # p params[:comment]
  @user = User.last

  @comment = Comment.new(text: params[:comment], user_id: @user.id )
  @question = Question.new()
  p @comment

end
