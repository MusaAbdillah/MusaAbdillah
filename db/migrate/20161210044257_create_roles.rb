class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :nama

      t.timestamps null: false
    end
  end
end
