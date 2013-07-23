require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the BlogsHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe UsersHelper do

  account = {
	:fullname => "Lương Ngọc Minh Phúc",
	:username => "minhphuc86",
	:password => "t4Js40!#%^!@$",
	:password_confirmation => "t4Js40!#%^!@$"
  }
  minhphuc = Users.find_by_username(account[:username])
  if minhphuc.nil?
	Users.create!(account)
  end

  describe "actionLogin" do

	it ".true" do
	  expect(account[:username]).not_to eq nil
	  expect(account[:password]).not_to eq nil

	  expect(helper.actionLogin(account[:username],account[:password])).to eq true
	  #upcase username
	  expect(helper.actionLogin(account[:username].upcase!,account[:password])).to eq true
	  #swapcase username
	  expect(helper.actionLogin(account[:username].swapcase!,account[:password])).to eq true
	end

	it ".false" do
	  #upcase password
	  expect(helper.actionLogin(account[:username],account[:password].upcase!)).to eq nil
	  #swapcase password
	  expect(helper.actionLogin(account[:username],account[:password].swapcase!)).to eq nil
	  #wrong password
	  expect(helper.actionLogin(account[:username],"abc")).to eq nil
    end

  end

  describe "actionLogout" do
	it ".No_Session" do
	  expect(helper.actionLogout).to eq true
	  expect(session[:user_id]).to eq nil
	end

	it ".Get_Session" do
	  session[:user_id] = "abc"
	  expect(session[:user_id]).to eq "abc"
	  expect(helper.actionLogout).to eq true
	  expect(session[:user_id]).to eq nil
	end

  end

  describe "require_getinfo" do

	it ".No_Session" do
	  session[:user_id] = nil
	  expect(session[:user_id]).to eq nil
	  expect(helper.require_getinfo).to eq false
	end

	it ".Get_Session_is_deleted" do
	  session[:user_id] = "abc"
	  expect(session[:user_id]).to eq "abc"
	  expect(helper.require_getinfo).to eq false
	end

	it ".Get_Session_is_existed" do
	  session[:user_id] = minhphuc.id
	  expect(session[:user_id]).to eq minhphuc.id
	  expect(helper.require_getinfo).to eq account[:fullname]
	end

  end

  describe "rememberLogin_getAccountfromCookie" do

	it ".rememberLogin[username_password_nil]" do
	  expect(helper.rememberLogin(nil,nil)).to eq nil
	  expect(helper.rememberLogin(account[:username],nil)).to eq nil
	  expect(helper.rememberLogin(nil,account[:password])).to eq nil
	end

	it ".getAccountfromCookie[cookie_nil]" do
	  cookies[:mem]
	  expect(helper.getAccountfromCookie).to eq false
	end

	it ".rememberLogin_to_getAccountfromCookie[username_password_existed]" do
	  data = TBlowfish.encrypt("#{account[:username]} #{account[:password]}")

	  expect(helper.rememberLogin(account[:username],account[:password])).to eq data
	  expect(helper.getAccountfromCookie).to eq [account[:username],account[:password]]
	end
  end

end