get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(email: params[:email], username: params[:username], password: params[:password] )

  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"

    # now they can actually login
  else
    @errors = ["Wrong email or password. Try again."]
    erb :'/users/new'
  end
end
