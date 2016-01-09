get '/surveys' do
  @surveys = Survey.all

  erb :"surveys/index"
end

get '/surveys/new' do
  erb :"surveys/new"
end


post '/surveys' do
  @survey = Survey.new(params[:survey])
  @survey.creator_id = session[:user_id]
  binding.pry
  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    @errors = @survey.errors.full_messages
    erb :"surveys/new"
  end
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if logged_in? && current_user.id = @survey.creator_id
    erb :"surveys/show"
  else
    redirect '/surveys/:id/complete_surveys/new'
  end
end

get '/surveys/:id/edit' do
 @survey = Survey.find(params[:id])
  if logged_in? && current_user.id = @survey.creator_id
    erb :"surveys/edit"
  else
    redirect '/surveys'
  end
end

put '/surveys/:id' do
@survey = Survey.assign_attributes(params[:survey])
  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    @errors = @survey.errors.full_messages
    erb :"surveys/edit"
  end
end

get '/surveys/:id/complete_surveys/new' do
  @survey = Survey.find_by(id: params[:id])
  erb :"completed_surveys/new"
end

delete '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  @survey.destroy
  redirect '/surveys'
end
