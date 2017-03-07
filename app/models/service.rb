class Service < ActiveRecord::Base
   belongs_to :client
   belongs_to :troubel

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
end
