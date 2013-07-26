require "spec_helper"

describe Users do

  before(:each) do
=begin
    @account = {
	  :fullname => "Lương Ngọc Minh Phúc",
	  :username => "minhphuc86",
	  :password => "t4Js40!#%^!@$",
	  :password_confirmation => "t4Js40!#%^!@$"
	}

    @minhphuc = Users.find_by_username(@account[:username])
=end
	@minhphuc = FactoryGirl.create(:tranvinh)
	@account = FactoryGirl.build(:tranvinh)
  end

  after(:each) do
	@minhphuc = nil
    @account = nil
  end

  context :check_login do
	it ".Check_login" do

	  expect(Users.checkLogin(@account[:username],@account[:password])).to eq @minhphuc
	  expect(Users.checkLogin(@account[:username],@account[:password])).to eq @minhphuc
	  expect(Users.checkLogin(@account[:username].upcase!,@account[:password])).to eq @minhphuc
	  expect(Users.checkLogin(@account[:username].swapcase!,@account[:password])).to eq @minhphuc

	  expect(Users.checkLogin(@account[:username],@account[:password].upcase!)).to eq nil
	  expect(Users.checkLogin(@account[:username],@account[:password].swapcase!)).to eq nil
	  expect(Users.checkLogin(@account[:username],"abc")).to eq nil

	end
  end

end