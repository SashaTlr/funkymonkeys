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

put '/surveys/:id/question' do
  survey = Survey.find(params[:id])
  question = survey.questions.update_attributes(params[:question])
  redirect "/surveys/#{survey.id}"
end

delete '/surveys/:id/question' do
  survey_id = params[:id]
  question = Question.find_by(id: params[:question][:id])
  question.destroy
  redirect "/surveys/#{survey_id}"
end