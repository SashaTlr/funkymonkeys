class Option < ActiveRecord::Base
  has_many :option_questions
  has_many :questions, through: :option_questions

  validates :text, presence: true
end
