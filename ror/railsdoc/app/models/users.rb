class Users < ActiveRecord::Base
  attr_accessible :fullname, :username, :password, :password_confirmation
  validates :fullname, :username, :length => { :minimum => 6, :maximum => 100}
  validates :password, :password_confirmation, :length => { :minimum => 6, :maximum => 100}, :on => :create
  validates :password, :confirmation => true, :on => :create
  validates :username, :uniqueness => true

end
