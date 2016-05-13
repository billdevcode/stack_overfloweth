class Response < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :as => :votable

  validates :text, presence: true

  def up_vote_sum
    votes.sum(:up_vote)
  end

  def down_vote_sum
    votes.sum(:down_vote)
  end

end
