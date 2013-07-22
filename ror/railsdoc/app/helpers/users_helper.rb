module UsersHelper
  require 'tBlowfish'

 def actionLogin(username,password)
	@user = Users.checkLogin(username,password)
	unless @user.nil?
	  session[:user_id] = @user.id

	  if flash[:uri].nil?
		redirect_to "/users"
	  else
		redirect_to flash[:uri]
	  end

	  return true;
	else
	  @user = Users.new(:username => username)
	  @error = "Username or Password wrong"
	  return false;
	end

 end

 def actionLogout
  session[:user_id] = nil
  redirect_to "/top"
 end

  def checkLogin
	flash[:uri] = request.original_url

	if session[:user_id].nil?
	  redirect_to("/login") and return false
	else

	  # find user by ID
	  begin
		userinfo = Users.find(session[:user_id])
	  rescue ActiveRecord::RecordNotFound => e
		redirect_to("/login") and return false
	  end

	end

  end

  def require_getinfo

	unless session[:user_id].nil?

	  begin
		userinfo = Users.find(session[:user_id])
	  rescue ActiveRecord::RecordNotFound => e
		return false
	  end

	  unless userinfo.nil?
		return userinfo.fullname
	  end

	end

	return false
  end

  def rememberLogin(username,password)
	data = TBlowfish.encrypt("#{username} #{password}")
	cookies[:mem] = { :value => data, :expires => Time.now + 3600}
	return data
  end

  def getAccountfromCookie()

	unless cookies[:mem].nil?
	  account = TBlowfish.decrypt(cookies[:mem]).split(/ /)
	  return account
	end

	return false
  end

end
