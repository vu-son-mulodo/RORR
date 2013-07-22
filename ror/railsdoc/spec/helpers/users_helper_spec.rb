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
  describe "actionLogin" do
	it ".true" do
	  account = {
		:fullname => "Lương Ngọc Minh Phúc",
		:username => "minhphuc86",
		:password => "t4Js40!#%^!@$",
		:password_confirmation => "t4Js40!#%^!@$"
	  }
	  Users.create!(account)

	  expect(helper.actionLogin(account[:username],account[:password])).to eq true
	  #upcase username
	  expect(helper.actionLogin(account[:username].upcase!,account[:password])).to eq true
	  #swapcase username
	  expect(helper.actionLogin(account[:username].swapcase!,account[:password])).to eq true

	  #upcase password
	  expect(helper.actionLogin(account[:username],account[:password].upcase!)).to eq nil
	  #swapcase password
	  expect(helper.actionLogin(account[:username],account[:password].swapcase!)).to eq nil
	  #wrong password
	  expect(helper.actionLogin(account[:username],"abc")).to eq nil

    end
  end
end