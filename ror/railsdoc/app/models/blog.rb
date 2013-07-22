class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :update

  validates :title, :presence => true, :length => { :minimum => 1, :maximum => 255}
  validates :content, :presence => true, :length => { :minimum => 1}


end
