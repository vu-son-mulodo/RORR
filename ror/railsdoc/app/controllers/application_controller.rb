class ApplicationController < ActionController::Base
  #protect_from_forgery
  helper_method :require_getinfo

  def require_getinfo
	if session[:user_id] != nil
	  begin
		userinfo = Users.find(session[:user_id])
	  rescue ActiveRecord::RecordNotFound => e
		return false
	  end
	  if userinfo != nil
		return userinfo.fullname
	  end
	end
	return false
  end

  def checkLogin
	if session[:user_id] == nil
	  redirect_to("/login") and return false
	end
  end
end
