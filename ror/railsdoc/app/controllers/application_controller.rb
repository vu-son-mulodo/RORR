class ApplicationController < ActionController::Base
  #protect_from_forgery
  include UsersHelper
  helper_method :require_getinfo

  def checkLogin

	if checksession == false
	  redirect_to @uri
	end

  end

end
