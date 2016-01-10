# get 'survey/:id/completed_survey/new' do
#   @survey = Survey.find(params[:id])
#   erb :'completed_survey/new'
# end

post '/completed_surveys' do

  #TODO: must be logged in to do this
  @new_survey = SurveyUser.new(survey_id: params[:survey][:id])
  @new_survey.user = current_user
  @new_survey.save
  redirect "/completed_surveys/#{@new_survey.id}/survey_responses/new"
end


get '/completed_surveys/:id/survey_responses/new' do
  #create instance variable from method call for next question
  @survey_user = SurveyUser.find(params[:id])
  @survey = @survey_user.survey
  @question = @survey.next_question(current_user)
  if @question
    erb :'/option_questions/show'
  else
    "we are done"
  end
  #find next question with #next_question method
  #@question = @survey.next_question
end

post '/survey_responses' do
  question = Question.find(params[:question][:id])
  survey = question.survey
  @survey_response = SurveyResponse.new(survey: survey, question: question, user: current_user, option_id: params[:option][:id])
  @survey_response.save
  redirect "/completed_surveys/#{survey.id}/survey_responses/new"
end

