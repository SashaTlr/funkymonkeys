class Survey < ActiveRecord::Base

  has_many :questions
  belongs_to :creator, class_name: "User"
  has_many :option_questions, through: :questions
  has_many :survey_responses

  validates :name, presence: true, length: {maximum: 64}
  validates :description, presence: true, length: {maximum: 128}

  def next_question(user)
    current_question_number = SurveyResponse.where(survey_id: self.id, user_id: user.id ).count
    questions = self.questions.map do |question|
      question
    end
    questions[current_question_number]
  end
end


