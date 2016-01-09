get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do
  erb :"surveys/new"
end

#create a new survey
post '/surveys' do
  @survey = Survey.new(params[:survey])
  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    @errors = @survey.errors.full_messages
    erb :"surveys/new"
  end
end

# #show survey and create questions and answers
# get '/surveys/:id' do
#   @survey = Survey.find(params[:id])
#   if logged_in? && current_user.id = @survey.creator_id
#     erb :"/surveys/show"
#   end
# end


get '/surveys/:id/edit' do
 @survey = Survey.find(params[:id])
 erb :"surveys/edit"
end

get 'surveys/:id/complete_surveys/new' do
  @survey = Survey.find_by(id: params[:id])
  erb :"completed_surveys/new"
end
