class TopController < ApplicationController
  def index
	@title = "Manager Users"
  end

  def login
	@title = "Login"
	@user = params[:user]
	@error = nil
	if @user != nil
	  @user = Users.find_by_username_and_password(@user[:username],@user[:password])
	  if @user != nil
		session[:user_id] = @user.id
		redirect_to "/users"
	  else
		@error = "Username or Password wrong"
	  end
	end
  end

  def logout
	session[:user_id] = nil
	redirect_to "/top"
  end
end
