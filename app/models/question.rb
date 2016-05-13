class Question < ActiveRecord::Base
	belongs_to :user
  has_many :answers
	has_many :votes, :as => :votable
	has_many :responses, :as => :respondable
	has_many :answers

	validates :title, :text, presence: true

	def up_vote_sum
		sum = 0
		p "***" * 50
		p self.votes
		self.votes.each do |vote|
			if vote.up_vote == 1
				sum += 1
			end
		end
		return sum
		# self.votes.sum(:up_vote)
		# p self.votes
	end

	def down_vote_sum
		self.votes.sum(:down_vote)
	end
end
