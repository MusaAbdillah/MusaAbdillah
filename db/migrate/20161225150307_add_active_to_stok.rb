class AddActiveToStok < ActiveRecord::Migration
  def change
    add_column :stoks, :active, :boolean
  end
end
