class Survey < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 64}
  validates :description, presence: true, length: {maximum: 128}

  has_many :questions
  # belongs_to :user

end
