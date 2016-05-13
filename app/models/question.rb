class Question < ActiveRecord::Base
	belongs_to :user
	has_many :votes, :as => :votable
	has_many :responses, :as => :respondable
	has_many :answers

	validates :title, :text, presence: true

	def up_vote_sum
		votes.sum(:up_vote)
	end

	def down_vote_sum
		votes.sum(:down_vote)
	end
end
