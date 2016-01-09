class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys
  has_many :survey_users

  validates :username, length: {maximum: 50}, presence: true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

