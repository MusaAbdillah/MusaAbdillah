class Stok < ActiveRecord::Base
	#aktifitas
	include PublicActivity::Model
  	tracked owner: ->(controller, model) { controller && controller.current_user}
	#relasi database
	belongs_to :kategori
	has_many :order_items, dependent: :destroy
	#uploader
	mount_uploader :gambar, AvatarUploader
	default_scope { where(active: true) }

	#validasi
	validates :gambar, :nama, :harga_beli, :harga_jual, :jumlah, :kategori_id, :presence => true
	validates_uniqueness_of :nama, :message => "nama tidak boleh sama"
	validates :harga_beli, :harga_jual, :numericality => { :greater_than_or_equal_to => 0, :message => "harga harus lebih dari atau sama dengan nol" }


	#method untuk menghitung profit/keuntungan
	def profit
		harga_jual - harga_beli
	end
	#method untuk jumlah stok
	def oi_quantity
		order_items.collect { |oi| oi.valid? ? (oi.quantity) : 0 }.sum
	end

	def update_quantity
		self[:jumlah] -= oi_quantity
	end

end
