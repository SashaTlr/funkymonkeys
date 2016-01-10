

put '/surveys/:id/options' do
  survey = Survey.find(params[:id])
  question = survey.questions.find_by(id: params[:question][:id])
  question.options.find_by(id: params[:options][:id]).destroy
  question.options << Option.find_or_create_by(text: params[:options][:text])
  redirect "/surveys/#{survey.id}"
end

delete '/surveys/:id/options' do
  survey_id = params[:id]
  question.options.find_by(id: params[:options][:id]).destroy
  redirect "/surveys/#{survey_id}"
end
