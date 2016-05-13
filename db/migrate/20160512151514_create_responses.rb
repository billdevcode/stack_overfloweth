class CreateResponses < ActiveRecord::Migration
  def change
  	 create_table :responses do |t|
  	  	t.belongs_to :user
        t.text :text
  	  	t.references :respondable, polymorphic: true, index: true

  	  	t.timestamps null: false
  	end
  end
end
