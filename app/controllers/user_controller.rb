get '/user/:id' do
  @user = User.find(params[:id])
  @posts = @user.posts
  @comments = @user.comments
  erb :'/users/show'
end

post '/user/new' do
  @user = User.create(params[:user])
  redirect :"user/#{@user.id}"
end

