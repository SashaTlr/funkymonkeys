post '/surveys/:id/question' do
  @survey = Survey.find(params[:id])

  question = @survey.questions.new(params[:question])

  if question.save
    params[:options].each do |option|
      new_option = question.options.create(text: option[1])
    end
  else
    @errors = question.errors.full_messages
  end

  redirect "/surveys/#{@survey.id}"
end


put '/surveys/:id/questions' do

  survey = Survey.find(params[:id])

  question = survey.questions.new(params[:question])

  if question.save
    parmas[:option].each do |option|
      new_option = question.options.save(text: option)
    end
  else
    @errors = question.errors.full_messages
  end
  redirect '/surveys/#{survey.id}'

end

delete '/surveys/:id/questions' do

end
