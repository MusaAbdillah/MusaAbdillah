class AddUserToStok < ActiveRecord::Migration
  def change
    add_reference :stoks, :user, index: true
    add_foreign_key :stoks, :users
  end
end
