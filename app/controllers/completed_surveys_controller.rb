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
    @survey_responses = current_user.survey_responses.where(survey: @survey)
    erb :'completed_surveys/show'
  end
end

post '/survey_responses' do
  question = Question.find(params[:question][:id])
  survey = question.survey
  @survey_response = SurveyResponse.new(survey: survey, question: question, user: current_user, option_id: params[:option][:id])
  @survey_response.save
  redirect "/completed_surveys/#{survey.id}/survey_responses/new"
end

