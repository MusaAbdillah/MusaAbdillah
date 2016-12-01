class CreateKategoris < ActiveRecord::Migration
  def change
    create_table :kategoris do |t|
    	t.string :gambar
    	t.string :nama
    	t.string :deskripsi
      	t.timestamps null: false
    end
  end
end
