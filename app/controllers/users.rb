get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @new_user = User.new(email: params[:email], username: params[:username], password: params[:password] )

  if @new_user.save
    session[:user_id] = @new_user.id
    redirect '/'

    # now they can actually login
  else
    @errors = @new_user.errors.full_messages
    erb :'/users/new'
  end
end
