class Question < ActiveRecord::Base
  validates :text, presence: true, length: {maximum: 512}
  validates :survey_id, presence: true

  belongs_to :survey
  has_many :option_questions

end
