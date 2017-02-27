class OrderStatus < ActiveRecord::Base
	#relasi
	has_many :orders
end
