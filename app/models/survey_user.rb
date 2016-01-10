class SurveyUser < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  has_many :survey_responses, through: :survey
  has_many :questions, through: :survey
  validates :survey_id, :user_id, null: false
end
