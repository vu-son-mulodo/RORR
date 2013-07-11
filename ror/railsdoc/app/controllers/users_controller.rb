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
	if @user != nil
	  @createUser = Users.create(params.require(:user).permit(:username,:fullname,:password,:password_confirmation))
	  if @createUser.valid? == false
		@user = Users.new(params[:user])
		@error = @createUser.errors
	  else
		redirect_to "/users"
	  end
	end
  end

  def edit
	checkLogin
	@title = "Edit User"

	begin
	  @user = Users.find(params[:id])
	rescue ActiveRecord::RecordNotFound => e
	  render :text => "Not found"
	end
	@error = nil
	if params[:user] != nil
	  @updateUser = Users.update(params[:id],params.require(:user).permit(:username,:fullname))
	  if @updateUser.valid? == false
		@error = @updateUser.errors
	  else
		redirect_to "/users"
	  end
	end

  end

  def del
	checkLogin
	@user = Users.find(params[:id])
	@user.destroy
	redirect_to "/users"
  end
end
