class Survey < ActiveRecord::Base

  has_many :questions
  belongs_to :creator, class_name: "User"
  has_many :option_questions, through: :questions

  validates :name, presence: true, length: {maximum: 64}
  validates :description, presence: true, length: {maximum: 128}

end

