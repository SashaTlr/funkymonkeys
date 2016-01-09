post '/surveys/:id/question' do
  params = {id: 1, question: {text: "TestQuestion"}, options: {"1" => "A", "2" => "C"}}
  @survey = Survey.find(params[:id])
  @question = Question.create(params[:question])
  @question.survey = @survey
  @question.save
  @options = params[:options]
  @options.each_value do |text|
    option = Option.where(text: text).first_or_create
    OptionQuestion.create(option: option, question: @question)
  end
  redirect '/surveys/:id'
end


put '/surveys/:id/questions' do

end

delete '/surveys/:id/questions' do

end
