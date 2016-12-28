class Stok < ActiveRecord::Base
	belongs_to :kategori
	has_many :order_items
	mount_uploader :gambar, AvatarUploader
	default_scope { where(active: true) }
	validates :gambar, :nama, :harga_beli, :harga_jual, :jumlah, :kategori_id, :presence => true
	validates_uniqueness_of :nama, :message => "nama tidak boleh sama"
	validates :harga_beli, :harga_jual, :numericality => { :greater_than_or_equal_to => 0, :message => "harga harus lebih dari atau sama dengan nol" }


	#method untuk menghitung profit/keuntungan
	def profit
		harga_jual-harga_beli
	end

end
