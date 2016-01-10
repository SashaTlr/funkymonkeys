

put '/surveys/:id/options' do

  survey = Survey.find(params[:id])
  binding.pry
  #put in logic to find the right option
  #need a hidden value in the options form - line 6, options/_edit.erb
  #option = survey.questions.options.update_attributes(text: params[:options])

  redirect '/surveys/#{survey.id}'

end

delete '/surveys/:id/options' do

end
