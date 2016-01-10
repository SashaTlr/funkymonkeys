post '/completed_surveys' do
  if !current_user.survey_users.find_by(survey_id: params[:survey][:id])
    @new_survey = current_user.survey_users.create(survey_id: params[:survey][:id])
    redirect "/completed_surveys/#{@new_survey.id}/survey_responses/new"
  else
    @survey = Survey.find(params[:survey][:id])
    @errors = ["You have already taken this survey."]
    erb :"completed_surveys/new"
  end
end


get '/completed_surveys/:id/survey_responses/new' do
  @survey_user = SurveyUser.find(params[:id])
  @survey = @survey_user.survey
  @question = @survey.next_question(current_user)
  if @question
    erb :'/option_questions/show'
  else
    redirect "/completed_surveys/#{@survey_user.id}"
  end
end

get '/completed_surveys/:id' do
    @survey = SurveyUser.find(params[:id]).survey
    @survey_responses = current_user.survey_responses.where(survey: @survey)
    erb :'completed_surveys/show'
end


