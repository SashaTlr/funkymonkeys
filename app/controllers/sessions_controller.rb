get '/login' do
  erb :'/login'
end

get '/logout' do
  session.clear
  redirect :'/posts'
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user and @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @user = User.new(params[:user])
    @errors = ["Username or password are incorrect."]
    erb :'/login'
  end
end