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
    erb :"questions/_edit"
end

put '/question/:id' do
  question = Question.find(params[:id])
  question.assign_attributes(params[:question])
  if !question.save
    @errors = question.errors.full_messages
  end
  redirect "/surveys/#{question.survey_id}"
end

delete '/question/:id' do
  question = Question.find(params[:id])
  survey = question.survey
  question.destroy
  redirect "/surveys/#{survey.id}"
end
