class SurveyResponse < ActiveRecord::Base
  belongs_to :survey
  belongs_to :response
  belongs_to :option
  belongs_to :question
  belongs_to :user

  validates :survey_id, :response_id, null: false
end
