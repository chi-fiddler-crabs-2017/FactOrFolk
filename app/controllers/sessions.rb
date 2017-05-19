get "/sessions/new" do
  erb :"sessions/new"
end

post "/sessions" do
  @user = User.find_by(email: params[:email])
  p @user
  p @user.email


  if @user && @user.authenticate(@user.email, @user.password)
    p "hello"
    session[:user_id] = @user.id
     redirect "/users/#{@user.id}" # goes back to whatever homepage
  else
    @errors = ["Wrong email or password. Try again."]
    erb :"sessions/new"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
