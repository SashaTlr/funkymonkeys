class OptionQuestion < ActiveRecord::Base
  belongs_to :option
  belongs_to :question

  validates :option_id, null: false
  validates :question_id, null: false
end
