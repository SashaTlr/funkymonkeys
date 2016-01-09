# get 'survey/:id/completed_survey/new' do
#   @survey = Survey.find(params[:id])
#   erb :'completed_survey/new'
# end


# post 'completed_surveys' do
#   @new_survey = CompletedSurvey.create(params[:completed_survey])
#   redirect "completed_surveys/#{@new_survey.id}/survey_responses/new"
# end

# get 'completed_surveys/:id/survey_responses/new' do
#   #create instance variable from method call for next question
#   erb: '/options_questions/show'
# end


