class Survey < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 64}
  validates :description, presence: true, length: {maximum: 128}

  has_many :questions
  # has_one :creator, through: :users, source: user
  # belongs_to :user need to add foreign key as a creator
  # survey takers associations
  has_many :option_questions, through: :questions


end
