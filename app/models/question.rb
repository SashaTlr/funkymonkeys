class Question < ActiveRecord::Base

  belongs_to :survey
  has_many :option_questions
  has_many :options, through: :option_questions
  has_many :survey_responses

  validates :text, presence: true, length: {maximum: 512}
  validates :survey_id, presence: true


end
