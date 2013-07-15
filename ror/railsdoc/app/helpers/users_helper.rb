module UsersHelper
 include ApplicationHelper

 def actionLogin(username,password)
	@user = Users.checkLogin(username,password)
	if @user != false
	  session[:user_id] = @user.id
	  redirect_to "/users"
	else
	  @user = Users.new(:username => username)
	  @error = "Username or Password wrong"
	end
 end

 def actionLogout
  session[:user_id] = nil
  redirect_to "/top"
 end

  def checkLogin
	if session[:user_id] == nil
	  redirect_to("/login") and return false
	end
  end

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

end
