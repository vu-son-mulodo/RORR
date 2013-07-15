class TopController < ApplicationController
  def index
	@title = "Manager Users"
  end

  def login
	@title = "Login"
	@user = params[:user]
	@error = nil
	if @user != nil
	  actionLogin(@user[:username],@user[:password])
	end
  end

  def logout
	actionLogout
  end
end
