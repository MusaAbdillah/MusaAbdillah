class Service < ActiveRecord::Base
   belongs_to :client
   belongs_to :troubel
   validates :code, :client_id, :troubel_id, presence: true
   before_save :generate_code

   #method untuk menghitung total biaya servis
   def service_price
      troubel.price if troubel.valid?
   end

   def total
      self[:total] = service_price
   end
   #method untuk print line
   def line
      return "=" * 121
   end

   def generate_code
      self[:code] = "#{id}#{SecureRandom.urlsafe_base64(3)}"
   end
end
