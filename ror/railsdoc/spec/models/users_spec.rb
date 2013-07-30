require "spec_helper"

describe ".Users" do
  fixtures :users

  before(:all) do
    @account = {
	  :fullname => "Lương Ngọc Minh Phúc",
	  :username => "minhphuc86",
	  :password => "t4Js40!#%^!@$",
	  :password_confirmation => "t4Js40!#%^!@$"
	}
  end


  after(:all) do
	@account = nil
	Users.delete_all
  end

  describe :check_login do
	it ".Check_login" do
	  @minhphuc = Users.find_by_username(@account[:username])
	  expect(Users.checkLogin(@account[:username],@account[:password])).to eq @minhphuc
	  expect(Users.checkLogin(@account[:username].upcase!,@account[:password])).to eq @minhphuc
	  expect(Users.checkLogin(@account[:username].swapcase!,@account[:password])).to eq @minhphuc

	  expect(Users.checkLogin(@account[:username],@account[:password].upcase!)).to eq nil
	  expect(Users.checkLogin(@account[:username],@account[:password].swapcase!)).to eq nil
	  expect(Users.checkLogin(@account[:username],"abc")).to eq nil

	end
  end

  describe :create do

	it ".validation_create_nil" do
	  expect(Users.create).to have(2).error_on(:fullname, :context => :create)
	  expect(Users.create).to have(2).error_on(:username, :context => :create)
	  expect(Users.create).to have(2).error_on(:password, :context => :create)
	  expect(Users.create).to have(2).error_on(:password_confirmation, :context => :create)
	end

	it ".validate_minimum" do
	  expect(Users.create(:fullname => "abc")).to have(1).error_on(:fullname, :context => :create)
	  expect(Users.create(:username => "abc")).to have(1).error_on(:username, :context => :create)
	  expect(Users.create(:password => "abc")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password_confirmation => "abc")).to have(1).error_on(:password_confirmation, :context => :create)
	end

	it ".validate_password" do
	  expect(Users.create(:password => "123456",:password_confirmation => "321321")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password => "123",:password_confirmation => "321321")).to have(2).error_on(:password, :context => :create)
	  expect(Users.create(:password => "112323",:password_confirmation => "3213")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password => "112",:password_confirmation => "321")).to have(2).error_on(:password, :context => :create)
	  expect(Users.create(:password => "123456",:password_confirmation => "123456")).to have(0).error_on(:password, :context => :create)
	end

	it ".validate_username_and_password_no_space" do
	  expect(Users.create(:username => "1234 56")).to have(1).error_on(:username, :context => :create)
	  expect(Users.create(:password => "123 456")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password_confirmation => "321 321")).to have(1).error_on(:password_confirmation, :context => :create)
	end

	it ".validate_record_create" do
	  expect(Users).to have(1).records
	  Users.create!(:fullname => "Lê Minh Hoàng", :username => "le.hoang", :password => "123123123", :password_confirmation => "123123123")
	  expect(Users).to have(2).record
	  expect(Users.where(:fullname => "Lê Minh Hoàng")).to have(1).record
	  expect(Users.where(:username => "le.hoang")).to have(1).record
	end

  end

  describe :update do

	it ".validation_nil" do
	  expect(Users.update(1,:fullname => "")).to have(2).error_on(:fullname, :context => :update)
	  expect(Users.update(1,:username => "")).to have(2).error_on(:username, :context => :update)
	  expect(Users.update(1,:password => "")).to have(0).error_on(:password, :context => :update)
	  expect(Users.update(1,:password_confirmation => "")).to have(0).error_on(:password_confirmation, :context => :update)
	end

	it ".validate_minimum" do
	  expect(Users.update(1,:fullname => "abc")).to have(1).error_on(:fullname, :context => :update)
	  expect(Users.update(1,:username => "abc")).to have(1).error_on(:username, :context => :update)
	end

	it ".validate_record_update" do
	  expect(Users.where(:fullname => "Lương Ngọc Minh Phúc",:username => "minhphuc86")).to have(1).record
	  Users.update(1,:fullname => "Nguyễn Minh Hoàng")
	  expect(Users.where(:fullname => "Nguyễn Minh Hoàng",:username => "minhphuc86")).to have(1).record
	  expect(Users.where(:fullname => "Lương Ngọc Minh Phúc",:username => "minhphuc86")).to have(0).record
	end

  end

end