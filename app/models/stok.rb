class Stok < ActiveRecord::Base
	include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}
	belongs_to :kategori
	has_many :order_items, dependent: :destroy

	mount_uploader :gambar, AvatarUploader
	default_scope { where(active: true) }

	validates :gambar, :nama, :harga_beli, :harga_jual, :jumlah, :kategori_id, :presence => true
	validates_uniqueness_of :nama, :message => "nama tidak boleh sama"
	validates :harga_beli, :harga_jual, :numericality => { :greater_than_or_equal_to => 0, :message => "harga harus lebih dari atau sama dengan nol" }


	#method untuk menghitung profit/keuntungan

	#def initialize(order_item)
	#	if order_item.present?
	#		@jml_order = order_items.quantity
	#	end
	#end


	def profit
		harga_jual - harga_beli
	end

	def sum_of_jumlah
		self.jumlah
	end

end
