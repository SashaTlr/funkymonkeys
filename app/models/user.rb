class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: "creator_id"
  has_many :survey_users
  has_many :survey_responses


  validates :username, length: {maximum: 50}, presence: true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

