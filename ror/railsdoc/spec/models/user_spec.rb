require "spec_helper"

describe ".Users" do

  before(:all) do
	@minhphuc = FactoryGirl.create(:tranvinh)
	@account = FactoryGirl.build(:tranvinh)
	@nguyenhoang = FactoryGirl.build(:nguyenhoang)
  end

  after(:all) do
	Users.delete_all
  end

#=begin
  describe "#check_login" do

	it "Check_login_exist" do
	  expect(Users.checkLogin(@account.username,@account.password)).to eq @minhphuc
	  expect(Users.checkLogin(@account.username.upcase!,@account.password)).to eq @minhphuc
	  expect(Users.checkLogin(@account.username.swapcase!,@account.password)).to eq @minhphuc
	end

	it "Check_login_nil" do
	  expect(Users.checkLogin(@account.username,@account.password.upcase!)).to eq nil
	  expect(Users.checkLogin(@account.username,@account.password.swapcase!)).to eq nil
	  expect(Users.checkLogin(@account.username,"abc")).to eq nil

	end

  end
#=end
#=begin
  describe "#create" do

	it "validation_create_nil" do
	  expect(Users.create).to have(2).error_on(:fullname, :context => :create)
	  expect(Users.create).to have(2).error_on(:username, :context => :create)
	  expect(Users.create).to have(2).error_on(:password, :context => :create)
	  expect(Users.create).to have(2).error_on(:password_confirmation, :context => :create)
	end

	it "validate_minimum" do
	  expect(Users.create(:fullname => "abc")).to have(1).error_on(:fullname, :context => :create)
	  expect(Users.create(:username => "abc")).to have(1).error_on(:username, :context => :create)
	  expect(Users.create(:password => "abc")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password_confirmation => "abc")).to have(1).error_on(:password_confirmation, :context => :create)
	end

	it "validate_password" do
	  expect(Users.create(:password => "123456",:password_confirmation => "321321")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password => "123",:password_confirmation => "321321")).to have(2).error_on(:password, :context => :create)
	  expect(Users.create(:password => "112323",:password_confirmation => "3213")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password => "112",:password_confirmation => "321")).to have(2).error_on(:password, :context => :create)
	end

	it ".validate_username_and_password_no_space" do
	  expect(Users.create(:username => "1234 56")).to have(1).error_on(:username, :context => :create)
	  expect(Users.create(:password => "123 456")).to have(1).error_on(:password, :context => :create)
	  expect(Users.create(:password_confirmation => "321 321")).to have(1).error_on(:password_confirmation, :context => :create)
	end

	it "validate_record_create" do
	  Users.create!(:fullname => @nguyenhoang.fullname, :username => @nguyenhoang.username, :password => @nguyenhoang.password, :password_confirmation => @nguyenhoang.password_confirmation)
	  expect(Users.where(:fullname => @nguyenhoang.fullname)).to have(1).record
	  expect(Users.where(:username => @nguyenhoang.username)).to have(1).record
	end

  end
#=end
#=begin
  describe "#update" do
	before do
	  @account = Users.find_by_username(@account['username'])
	end

	it "validation_nil" do
	  expect(Users.update(@account.id.to_s,:fullname => "")).to have(2).error_on(:fullname, :context => :update)
	  expect(Users.update(@account.id.to_s,:username => "")).to have(2).error_on(:username, :context => :update)
	  expect(Users.update(@account.id.to_s,:password => "")).to have(0).error_on(:password, :context => :update)
	  expect(Users.update(@account.id.to_s,:password_confirmation => "")).to have(0).error_on(:password_confirmation, :context => :update)
	end

	it "validate_minimum" do
	  expect(Users.update(@account.id.to_s,:fullname => "abc")).to have(1).error_on(:fullname, :context => :update)
	  expect(Users.update(@account.id.to_s,:username => "abc")).to have(1).error_on(:username, :context => :update)
	end

	it "validate_record_update" do
	  Users.update(@account.id.to_s,:fullname => "Nguyễn Minh Hoàng")
	  expect(Users.where(:fullname => "Nguyễn Minh Hoàng",:username => @account.username)).to have(1).record
	  expect(Users.where(:fullname => @account.fullname,:username => @account.username)).to have(0).record
	end

  end
#=end
end