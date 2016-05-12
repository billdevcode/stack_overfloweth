class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes

  validates :username, :email, :password, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
