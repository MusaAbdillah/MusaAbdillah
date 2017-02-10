class Kategori < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user}
	has_many :stoks, dependent: :destroy
	mount_uploader :gambar, AvatarUploader
	validates_presence_of :nama, :deskripsi, :message => "tidak boleh di kosongkan!"
	validates_uniqueness_of :nama, :message => "nama tidak boleh sama"
	validates_length_of :nama, :maximum => 22, :message => "nama harus kurang dari 23 karakter"

	def jumlah_stok
		stoks.count
	end
end
