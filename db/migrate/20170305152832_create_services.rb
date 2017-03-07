class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :code
      t.integer :sub_total
      t.integer :total
      t.belongs_to :client, index: true
      t.belongs_to :troubel, index: true
      t.timestamps null: false
    end
  end
end
