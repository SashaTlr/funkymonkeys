get '/user/:id' do
  @user = User.find(params[:id])
  @suveys = @user.surveys
  erb :'/users/show'
end

post '/user/new' do
  @user = User.create(params[:user])
  redirect :"user/#{@user.id}"
end

