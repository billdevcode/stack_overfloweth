class User < ActiveRecord::Base
  has_many :questions
  has_many :answers, through :questions
  has_many :responses, through :questions
  has_many :votes, through :questions
end
