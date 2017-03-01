class Role < ActiveRecord::Base
	#record aktifitas
   include PublicActivity::Model
   tracked owner: ->(controller, model) { controller && controller.current_user}
	
	#relasi database
	has_many :users
	#validasi
	validates_uniqueness_of :nama, :message => "nama role sudah ada"
	validates_presence_of :nama
end
