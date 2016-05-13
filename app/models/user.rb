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

  def self.authenticate(args)
    user = User.find_by(email: args['email'])
    p user
    user && user.password == args['password'] ? user : nil
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
