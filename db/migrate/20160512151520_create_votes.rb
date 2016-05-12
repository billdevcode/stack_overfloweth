class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.belongs_to :user
  		t.integer 	:up_vote
  		t.integer	:down_vote
  		t.references :votable, polymorphic: true, index: true

      	t.timestamps null: false
  	end
  end
end
