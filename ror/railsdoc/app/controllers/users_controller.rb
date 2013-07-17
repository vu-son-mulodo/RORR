class UsersController < ApplicationController
  #http_basic_authenticate_with :name => "minhphuc", :password => "t4js40"
  def index
	checkLogin
	@title = "Manager Users"
	@users = Users.all
  end

  def new
	checkLogin
	@title = "Create User"
	@user = params[:user]
	@error = nil

	unless @user.nil?
	  @createUser = Users.create(params.require(:user).permit(:username,:fullname,:password,:password_confirmation))

	  unless @createUser.valid?
		@user = Users.new(params[:user])
		@error = @createUser.errors
	  else
		redirect_to "/users"
	  end

	end
  end

  def edit

	if checkLogin
	  @title = "Edit User"

	  begin
		@user = Users.find(params[:id])
	  rescue ActiveRecord::RecordNotFound => e
		render(:text => "Not found")
	  end

	  @error = nil

	  unless params[:user].nil?
		@updateUser = Users.update(params[:id],params.require(:user).permit(:username,:fullname))

		unless @updateUser.valid?
		  @error = @updateUser.errors
		else
		  redirect_to "/users"
		end

	  end

	end

  end

  def del

	if checkLogin
	  @user = Users.find(params[:id])
	  @user.destroy
	  redirect_to "/users"
	end

  end

  def search

	if checkLogin

	  unless params[:key].nil?
		@users = Users.find(:all, :conditions => ["username LIKE ?","%" << params[:key] << "%"])
	  else
		@users = Users.all
	  end

	  render :partial => "userList", :collection => @users
	end

  end

end
