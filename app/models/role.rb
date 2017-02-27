class Role < ActiveRecord::Base
	#relasi database
	has_many :users
	#validasi
	validates_uniqueness_of :nama, :message => "nama role sudah ada"
	validates_presence_of :nama
end
