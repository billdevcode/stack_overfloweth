class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.belongs_to :user
  		t.string :title
  		t.text :text
  		t.integer :best_answer_id

  		t.timestamps null: false
  	end

  	add_index :questions, :best_answer_id
  end
end
