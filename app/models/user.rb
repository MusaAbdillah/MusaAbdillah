
class User < ActiveRecord::Base
   #record aktifitas
   include PublicActivity::Model
   tracked owner: ->(controller, model) { controller && controller.current_user}

   #relasi database
   belongs_to :role

   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

   #validasi password dengan regex
   validates_format_of :password, :with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/,:multiline => true , :message => "password minimal 6 character berisi huruf dan angka"
   validates_uniqueness_of :email

   #callback
   before_create :set_default_role

      def set_default_role
         self.role ||= Role.find_by_nama('user')
      end
end
