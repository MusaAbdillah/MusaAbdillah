class CreateStoks < ActiveRecord::Migration
  def change
    create_table :stoks do |t|
    	t.string :gambar
    	t.string :nama
    	t.integer :harga_beli
    	t.integer :harga_jual
    	t.integer :jumlah
    	t.references :kategori
      t.timestamps null: false
    end
  end
end
