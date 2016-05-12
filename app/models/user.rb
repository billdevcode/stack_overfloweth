class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :responses
  has_many :votes

  include BCrypt

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.password == password ? user : nil
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
