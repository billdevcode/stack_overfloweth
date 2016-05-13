class Question < ActiveRecord::Base
	belongs_to :user
	has_many :votes, :as => :votable
	has_many :responses, :as => :respondable

	validates :title, :text, presence: true
end
