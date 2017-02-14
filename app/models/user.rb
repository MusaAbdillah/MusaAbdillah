class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  #validate :password_complexity
  before_create :set_default_role

    def password_complexity
      if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
        errors.add :password, "harus mengandung huruf besar, huruf kecil dan angka"
      end
    end

    def set_default_role
      self.role ||= Role.find_by_nama('user')
    end
end
