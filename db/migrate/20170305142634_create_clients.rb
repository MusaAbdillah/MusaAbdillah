class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :image
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.text :address
      t.timestamps null: false
    end
  end
end
