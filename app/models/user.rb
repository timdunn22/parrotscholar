class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Variableize
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable
        #  , :omniauth_providers => [:facebook, :linkedin, :twitter, :google_oauth2]
  validates :username, :uniqueness => {:case_sensitive => false}
  # validates_presence_of :uid, :provider
  # validates_uniqueness_of :uid, :scope => :provider
  has_one :teacher, dependent: :destroy
  has_one :student, dependent: :destroy
  has_one :entrepreneur, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :users_interests, dependent: :destroy
  has_many :class_styles, dependent: :destroy
  has_many :class_types, dependent: :destroy
  has_many :time_slots, dependent: :destroy
  has_many :profile_policies, dependent: :destroy
  has_many :links, dependent: :destroy
  has_many :student_groups, through: :student_group_members
  has_many :student_group_members, dependent: :destroy
  has_many :courses
  accepts_nested_attributes_for :attachments,:reject_if => lambda { |a| a[:file_name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :class_types,:reject_if => lambda { |a| !$types.any? {|type| a[type]=="1"} }, :allow_destroy => true
  accepts_nested_attributes_for :class_styles,:reject_if => lambda { |a| !$styles.any? {|style| a[style]=="1"} }, :allow_destroy => true
  accepts_nested_attributes_for :profile_policies,:reject_if => lambda { |a| !$preferences.any? {|preference| a[preference]=="1"} }, :allow_destroy => true
  accepts_nested_attributes_for :users_interests, :reject_if => lambda {|a| a[:active]== "0" || a[:subject].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :student_group_members
  mount_uploader :avatar, AvatarUploader
  # adding search functionality to my app
  attr_accessor :signin, :user_type


  def interests
    UsersInterest.where(user_id: self.id)
  end
  def type_interests(type)
    UsersInterest.where(user_id:self.id, user_type: type)
  end
  def profile_preferences
    ProfilePolicy.where(user_id: self.id)
  end
  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
  ["student","teacher","entrepreneur"].each do |type|
    define_method("is_#{type}?") do
      User.find_by(id: self.id).send(type)
    end
  end


     def self.process_omniauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

         user.provider = auth.provider
         user.uid = auth.uid
         user.username = auth.info.nickname
         user.email = auth.info.email.present? ? auth.info.email : "1234tyu@example.com"
         user.skip_confirmation!
         user.save!
       end
     end
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   user.email = auth.info.email
  #   user.password = Devise.friendly_token[0,20]
  #   user.name = auth.info.name   # assuming the user model has a name
  #   user.avatar = auth.info.image # assuming the user model has an image
  #   end
  # end
#   def self.from_omniauth(auth)
#   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
#     user.provider = auth.provider
#     user.uid = auth.uid
#     user.name = auth.info.name
#     user.oauth_token = auth.credentials.token
#     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#     user.save!
#   end
# end

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

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if signin = conditions.delete(:signin)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => signin.downcase }]).first
      else
        where(conditions.to_hash).first
      end
    end

  #    def self.find_first_by_auth_conditions(warden_conditions)
  #      conditions = warden_conditions.dup
  #      where(conditions).where(["lower(username) = :value OR lower(email)
  #  = :value", { :value => signin.downcase }]).first
  #  end
end
