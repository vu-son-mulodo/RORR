require "spec_helper"

describe Users do
  context "Add 2 commend" do
	it "orders by last name" do
	  lindeman = Users.create!(:fullname => "Andyman", :username => "Andyman", :password => "123123123", :password_confirmation => "123123123")
	  chelimsky = Users.create!(:fullname => "Lindeman", :username => "Lindeman", :password => "123123123", :password_confirmation => "123123123")

	  expect(Users.reload.comments).to eq([comment2, comment1])
	end
  end
end