class Kategori < ActiveRecord::Base
	has_many :stoks
	mount_uploader :gambar, AvatarUploader
	validates_presence_of :nama, :deskripsi, :message => "tidak boleh di kosongkan!"
	validates_length_of :nama, :maximum => 22, :message => "nama harus kurang dari 23 karakter"

	def jumlah_stok
		stoks.count
	end
end
