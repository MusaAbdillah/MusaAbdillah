class CreateTroubels < ActiveRecord::Migration
  def change
    create_table :troubels do |t|
      t.text :name
      t.text :grade
      t.integer :price
      t.timestamps null: false
    end
  end
end
