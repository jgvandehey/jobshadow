class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :company, :linkedin_url, :location, :industry, :avatar
  # attr_accessible :title, :body
  validates_uniqueness_of :username
  has_attached_file :avatar,
  :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "http://checkmybackdoor.s3.amazonaws.com/images/noprofile.png"

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.avatar = auth['info']['image'].sub("_normal", "")
  		user.username = auth["info"]["nickname"]
    # user.username = auth.info.nickname
end
end
def password_required?
	super && provider.blank?
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
def update_with_password(params, *options)
	if encrypted_password.blank?
		update_attributes(params, *options)
	else
		super
	end
end
end
