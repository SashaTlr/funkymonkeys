post '/surveys/:id/question' do
  @survey = Survey.find(params[:id])
  question = @survey.questions.new(params[:question])

  if question.save
    params[:options].each do |option|
      new_option = question.options.find_or_create_by(text: option[1])
    end
  else
    @errors = question.errors.full_messages
  end
  redirect "/surveys/#{@survey.id}"
end

get '/question/:id/edit' do
  @question = Question.find(params[:id])
  if request.xhr?
    erb :"questions/_edit", layout: false
  else
    erb :"questions/_edit"
  end
end


put '/question/:id' do
  question = Question.find(params[:id])
  question.update_attributes(params[:question])
  question.delete_options
  params[:options].each do |option|
    question.options << Option.find_or_create_by(text: option[1])
  end
  @survey = question.survey
  if request.xhr?
    erb :"questions/_show", layout: false
  else
    redirect "/surveys/#{question.survey_id}"
  end
end

delete '/question/:id' do
  question = Question.find(params[:id])
  survey = question.survey
  question.destroy
  redirect "/surveys/#{survey.id}"
end
