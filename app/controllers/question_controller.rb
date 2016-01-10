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

<<<<<<< HEAD
put '/surveys/:id/question/edit' do
  survey = Survey.find(params[:id])
  question = Question.find_by(id: params[:question][:id])
  question.update_attributes(params[:question])

  question.delete_options

  params[:options].each do |option|
    question.options << Option.find_or_create_by(text: option[1])
=======
get '/question/:id/edit' do
  @question = Question.find(params[:id])
    erb :"questions/_edit"
end

put '/question/:id' do
  question = Question.find(params[:id])
  question.assign_attributes(params[:question])
  if !question.save
    @errors = question.errors.full_messages
>>>>>>> 84c3be05a3293b63fb3f8c09c4d88fa7fd8d933e
  end
  redirect "/surveys/#{question.survey_id}"
end

<<<<<<< HEAD
delete '/surveys/:id/question' do
  survey_id = params[:id]
  question = Question.find_by(id: params[:question][:id])
=======
delete '/question/:id' do
  question = Question.find(params[:id])
  survey = question.survey
>>>>>>> 84c3be05a3293b63fb3f8c09c4d88fa7fd8d933e
  question.destroy
  redirect "/surveys/#{survey.id}"
end
