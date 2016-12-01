class Stok < ActiveRecord::Base
	belongs_to :kategori
	mount_uploader :gambar, AvatarUploader
	validates_presence_of :nama, :harga_beli, :harga_jual, :jumlah, :kategori_id


	#method untuk menghitung profit/keuntungan
	def profit
		harga_jual-harga_beli
	end

end
