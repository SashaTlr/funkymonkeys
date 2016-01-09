2.times {
  survey = Survey.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence)
  4.times {
    question = Question.create(text: (Faker::Lorem.sentence + "?"), survey: survey)
    4.times {
      option = Option.create(text: Faker::Lorem.word)
      option_question = OptionQuestion.create(option: option, question: question)
    }
  }
}


