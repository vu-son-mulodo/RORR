class TopController < ApplicationController
  def index
	@title = "Manager Users"
  end

  def login
	flash.keep(:uri)
	@title = "Login"
	print params[:user]
	@user = params[:user]
	@store = @user
	@remember = params[:checkbox]
	@error = nil

	if (@user != nil) && (@user[:username] != nil) && (@user[:password] != nil)

	  unless actionLogin(@user[:username],@user[:password]).nil?

		#store cookie
		if (defined? @remember[:remember]) && (@remember[:remember] == "1")
		  rememberLogin(@store[:username],@store[:password])
		end

		redirect_to @uri
	  end

	end

  end

  def logout
	actionLogout
	redirect_to @uri
  end
end
