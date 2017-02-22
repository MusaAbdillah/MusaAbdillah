class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  #validasi password dengan regex
  validates_format_of :password, :with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/,:multiline => true , :message => "password minimal 6 character berisi huruf dan angka"
  before_create :set_default_role

      def set_default_role
         self.role ||= Role.find_by_nama('user')
      end
end
