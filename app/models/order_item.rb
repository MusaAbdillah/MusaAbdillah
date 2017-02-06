class OrderItem < ActiveRecord::Base
  belongs_to :stok
  belongs_to :order
  #validates_uniqueness_of :stok_id, :message => 'item ini sudah di masukkan ke keranjang'
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present
  validates :order_id, :uniqueness => { :scope => :stok_id, :message => "Stok already added." }

  before_save :finalize



  def unit_price
    persisted? ? self[:unit_price] : stok.harga_jual
  end

  def total_price
    unit_price * quantity
  end

  def final_total
    self[:total_price] += self[:total_price]
  end



private
  def product_present
    if stok.nil?
      errors.add(:stok, "stok tidak valid")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "stok tidak valid atau sudah di tambahkan")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
