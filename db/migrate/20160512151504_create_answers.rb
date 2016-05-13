class CreateAnswers < ActiveRecord::Migration
  def change
  	 create_table :answers do |t|
  	  	t.belongs_to :user
        t.string :text

  	  	t.timestamps
  	end
  end
end
