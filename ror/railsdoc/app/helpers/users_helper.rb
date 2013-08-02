module UsersHelper
  require 'tBlowfish'

 def actionLogin(username,password)
	@user = Users.checkLogin(username,password)
	unless @user.nil?
	  session[:user_id] = @user.id

	  if flash[:uri].nil?
		@uri = "/users"
	  else
		@uri = flash[:uri]
	  end
	  return true;
	else
	  @user = Users.new(:username => username)
	  @error = "Username or Password wrong"
	  return nil;
	end

 end

 def actionLogout
  session[:user_id] = nil
  cookies.delete(:mem)
  @uri = "/top"
  return true
 end
#----------------------
  def checkLogin
	flash[:uri] = request.original_url

	if session[:user_id].nil?
	  @cookie = getAccountfromCookie()

	  if @cookie != false
		actionLogin(@cookie[0],@cookie[1])
	  end

	  unless @uri.nil?
		redirect_to @uri
	  else
		redirect_to "/login"
		return false
	  end

	else

	  # find user by ID
	  begin
		userinfo = Users.find(session[:user_id])
	  rescue ActiveRecord::RecordNotFound => e
		redirect_to "/login"
		return false
	  end

	end

	return true
  end
#----------------------
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

	if (!username.nil? && !password.nil?)
	  data = TBlowfish.encrypt("#{username} #{password}")
	  cookies[:mem] = { :value => data, :expires => Time.now + 3600}
	  return data
	else
	  return nil
	end

  end

  def getAccountfromCookie()

	unless cookies[:mem].nil?
	  account = TBlowfish.decrypt(cookies[:mem]).split(/ /)
	  return account
	end
	@error = "Username or Password wrong"
	return false
  end

end
