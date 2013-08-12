class Users < ActiveRecord::Base

  attr_accessible :fullname, :username, :password, :password_confirmation
  validates :fullname, :username, :presence => true, :length => { :minimum => 6, :maximum => 100}
  validates :password, :password_confirmation, :presence => true,
	:length => { :minimum => 6, :maximum => 100},
	:format => { :with =>  /^[^ ]*$/i, :message => "please input character no space" },
	:on => :create
  validates :password, :confirmation => true, :on => :create
  validates :username,
	:uniqueness => true,
	:format => { :with =>  /^[^ ]*$/i, :message => "please input character no space" }

  before_create :encrypt_password
  before_update :require_update

  def require_update
	self.username.downcase!
  end

  def encrypt_password
	self.username.downcase!
	self.password = TBlowfish.encrypt(self.password)
	self.password_confirmation = TBlowfish.encrypt(self.password_confirmation)
	#puts self.password
	#puts self.password_confirmation
  end

  def self.checkLogin(username,password)
	username.downcase!
	password = TBlowfish.encrypt(password)
	check = Users.find_by_username_and_password(username,password)
	return check
  end

end
