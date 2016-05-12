class CreateResponses < ActiveRecord::Migration
  def change
  	 create_table :responses do |t|
  	  	t.belongs_to :user
  	  	t.references :respondable, polymorphic: true, index: true

  	  	t.timestamps
  	end
  end
end
