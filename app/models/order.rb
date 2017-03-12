class Order < ActiveRecord::Base
   #record aktifitas
   include PublicActivity::Model
   tracked owner: ->(controller, model) { controller && controller.current_user}

  #relasi database
   belongs_to :order_status
   has_many :order_items, dependent: :destroy

  #callback
   before_create :set_order_status
   before_save :update_subtotal


      def subtotal
         order_items.collect { |oi| oi.valid? ? (oi.total_price) : 0 }.sum
      end

      def total
         order_items.collect { |oi| oi.valid? ? (oi.total_price) : 0 }.sum
      end

      def jumlah
         order_items.collect { |oi| oi.valid? ? (oi.quantity) : 0 }.sum
      end


      private
         def set_order_status
            self.order_status_id = 1
         end

         def update_subtotal
            self[:subtotal] = subtotal
         end

         def update_subtotal
            self[:total] = total
         end



end
