get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do
  if logged_in?
    erb :"surveys/new"
  else
    redirect '/login'
  end
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if logged_in?
    if current_user.id == @survey.creator_id
      erb :"surveys/show"
    else
      redirect '/surveys/#{@survey.id}/complete_surveys/new'
    end
  else
    redirect '/login'
  end
end

post '/surveys' do
  @survey = current_user.surveys.new(params[:survey])
  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    @errors = @survey.errors.full_messages
    erb :"surveys/new"
  end
end


get '/surveys/:id/edit' do
 @survey = Survey.find(params[:id])
  if current_user.id = @survey.creator_id
    erb :"surveys/edit"
  else
    redirect '/surveys'
  end
end

get '/surveys/:id/completed_surveys/new' do
  @surveys = Survey.all
  @survey = Survey.find_by(id: params[:id])
  if logged_in?
    erb :"completed_surveys/new"
  else
    @errors = ["You must be logged in to take this survey."]
    erb :"surveys/index"
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
