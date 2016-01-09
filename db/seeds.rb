2.times {
  user = User.create(username:Faker::Internet.user_name , password_hash: Faker::Internet.password(8))
  survey = Survey.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence, creator_id: user.id)
  4.times {
    question = Question.create(text: (Faker::Lorem.sentence + "?"), survey: survey)
    4.times {
      option = Option.create(text: Faker::Lorem.word)
      option_question = OptionQuestion.create(option: option, question: question)

    }
  }
}


User.all.each do |user|
  Survey.all.each do |survey|
    survey_taker = SurveyUser.create(survey_id: survey.id, user_id: user.id)
    survey.questions.each do |question|
      survey_responses = SurveyResponse.create(survey_id: survey.id, user_id: user.id, question_id: question.id, option_id: rand(1..4))
    end
  end
end
