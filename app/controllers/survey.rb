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
    erb :"/surveys/new"
  end
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :"/surveys/show"
end
