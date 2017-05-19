get '/users' do
  # dummy route to all users page
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  # find is auto the user id
  @user = User.find(params[:id])
  erb :'users/show'
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
