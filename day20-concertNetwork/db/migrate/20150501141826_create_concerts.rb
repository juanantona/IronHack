class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :band, null: false
      t.string :venue, null: false
      t.string :city, null: false
      t.date :date, null: false
      t.integer :price, null: false
      t.string :description
      t.timestamps null: false
    end
  end
end
