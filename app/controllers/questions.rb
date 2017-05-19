get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions/:id/comments' do
  if logged_in? && current_user

  @question = Question.find(params[:id])
  @comment = Comment.new(text: params[:comment], user_id: current_user.id )
    if @comment.text == ""
      redirect "/questions/#{@question.id}"
    else
      @question.comments << @comment
      @comment.save
    end
  else
  end
  redirect "/questions/#{@question.id}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @comments = @question.comments
  erb :'questions/show'
end


