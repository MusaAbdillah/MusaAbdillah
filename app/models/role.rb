class Role < ActiveRecord::Base
	has_many :users
	validates_uniqueness_of :nama, :message => "nama role sudah ada"
end
