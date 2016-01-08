post 'survey_responses' do
  @survey_response = SurveyResponse.create(params[:survey_response])
  redirect "completed_surveys/#{survey_response.survey_id}/survey_responses/new"
end
