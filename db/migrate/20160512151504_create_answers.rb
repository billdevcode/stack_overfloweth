class CreateAnswers < ActiveRecord::Migration
  def change
  	 create_table :answers do |t|
  	  	t.belongs_to :user
        t.text :text
        t.belongs_to :question


  	  	t.timestamps null: false
  	end
  end
end
