class TopController < ApplicationController
  def index
	@title = "Manager Users"
  end

  def login
	flash.keep(:uri)
	@title = "Login"
	@user = params[:user]
	@store = @user
	@remember = params[:checkbox]
	@error = nil
	if (@user != nil) && (@user[:username] != "") && (@user[:password] != "")
	  if actionLogin(@user[:username],@user[:password]) == true
		#store cookie
		if (defined? @remember[:remember]) && (@remember[:remember] == "1")
		  rememberLogin(@store[:username],@store[:password])
		end
	  end
	else
	  @cookie = getAccountfromCookie()
	  if @cookie != false
		actionLogin(@cookie[0],@cookie[1])
	  else
		@user = Users.new
	  end
	end
  end

  def logout
	actionLogout
  end
end
