class Response < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :as => :votable

  validates :text, presence: true
end
