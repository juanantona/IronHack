class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :concert_id, null: false
      t.text :author	
      t.text :comment, null: false	
      t.timestamps null: false
    end
  end
end
