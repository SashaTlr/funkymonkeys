get '/user/:id' do
  @user = User.find(params[:id])
  @surveys = @user.surveys
  erb :'/users/show'
end

post '/user/new' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect :"/"
end

