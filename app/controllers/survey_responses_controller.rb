post '/survey_responses' do
  question = Question.find(params[:question][:id])
  survey = question.survey
  @survey_response = SurveyResponse.new(survey: survey, question: question, user: current_user, option_id: params[:option][:id])
  @survey_response.save
  redirect "/completed_surveys/#{survey.id}/survey_responses/new"
end
