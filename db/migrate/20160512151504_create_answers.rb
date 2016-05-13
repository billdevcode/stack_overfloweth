class CreateAnswers < ActiveRecord::Migration
  def change
  	 create_table :answers do |t|
  	  	t.belongs_to :user
        t.text :text
        t.integer :question_id

  	  	t.timestamps null: false
  	end
  end
end
