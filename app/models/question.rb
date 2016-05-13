class Question < ActiveRecord::Base
	belongs_to :user
  has_many :answers
	has_many :votes, :as => :votable
	has_many :responses, :as => :respondable
	has_many :answers

	validates :title, :text, presence: true

	def up_vote_sum
		votes.sum("1 + :up_vote")
	end

	def down_vote_sum
		votes.sum(:down_vote)
	end
end
