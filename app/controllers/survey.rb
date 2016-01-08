get '/surveys' do
  @surveys = Survey.all
  erb :"/surveys/index"
end

get '/surveys/new' do
  @survey = Survey.new
  erb :"/surveys/new"
end

post '/surveys' do
  @survey = Survey.new(params[:Survey])
  if @survey.save
    redirect '/surveys'
  else
    erb :"/surveys/new"
  end
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :"/surveys/show"
end
