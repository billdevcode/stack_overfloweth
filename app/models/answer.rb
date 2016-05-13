class Answer < ActiveRecord::Base
	belongs_to :user
	has_many :votes, :as => :votable
	has_many :responses, :as => :respondable
	has_many :questions

	validates :text, presence: true
end
