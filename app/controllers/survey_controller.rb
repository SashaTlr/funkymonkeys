get '/surveys' do
  @surveys = Survey.all
  erb :"/surveys/index"
end

get '/surveys/new' do
  erb :"/surveys/new"
end

post '/surveys' do
  @survey = Survey.new(params[:survey])
  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    @errors = @survey.errors.full_messages
    erb :"/surveys/new"
  end
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :"/surveys/show"
end

 # get 'survey/:id/edit' do
 #   @survey = Survey.find(params[:id])

 #   erb :"/surveys/edit"

 # end

