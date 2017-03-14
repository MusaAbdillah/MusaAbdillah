class Client < ActiveRecord::Base
   has_many :services
   has_many :troubels, through: :services
   mount_uploader :image, AvatarUploader
   validates :first_name, :last_name, :phone_number, :address, presence: true


   def full_name
      "#{self.first_name} #{self.last_name}"
   end

end

#demo@abtech.com
#demoAplikasi_99
