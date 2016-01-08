class Option < ActiveRecord::Base
  has_many :option_questions

  validates :text, presence: true
end
