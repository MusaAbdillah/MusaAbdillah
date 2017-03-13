class Troubel < ActiveRecord::Base
   has_many :services
   has_many :clients, through: :services
   validates :name, :grade, :price, presence: true
end
