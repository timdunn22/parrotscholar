class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  validates :username, :uniqueness => {:case_sensitive => false}
  attr_accessor :signin

     def self.process_omniauth(auth)
       where(auth.slice(:provider, :uid)).first_or_create do |user|
         user.provider = auth.provider
         user.uid = auth.uid
         user.username = auth.info.nickname
       end
     end

    def self.new_with_session(params, session)
     if session["devise.user_attributes"]
       new(session["devise.user_attributes"], without_protection: true) do |user|
         user.attributes = params
         user.valid?
       end
     else
       super
     end
    end

    def password_required?
      super && provider.blank?
    end

    def update_with_password(params, *options)
      if encrypted_password.blank? && provider.present?
       update_attributes(params, *options)
      else
      ￼ super
      end
    end
     def self.find_first_by_auth_conditions(warden_conditions)
       conditions = warden_conditions.dup
       where(conditions).where(["lower(username) = :value OR lower(email)
   = :value", { :value => signin.downcase }]).first
   end
end
