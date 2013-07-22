class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :update

  validates :title, :presence => true, :length => {:maximum => 255}
  validates :content, :presence => true


end
