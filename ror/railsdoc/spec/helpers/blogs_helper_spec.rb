require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the BlogsHelper. For example:
#
# describe BlogsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe BlogsHelper do
  #include UsersHelper

  describe "#bool" do
    it "return true or false" do
      helper.bool.should be_true
    end

    it "return name default" do
      expect(helper.nameHelperDefault).to eq("RSpec is your friend")
    end
  end

  describe "#page_title" do
    it "returns the instance variable" do
      assign(:title, "My Title")
      helper.page_title.should eql("My Title")
    end
  end

  describe "#require_getinfo" do

    it "No_Session" do
      session[:user_id] = nil
      expect(session[:user_id]).to eq nil
      expect(helper.require_getinfo).to eq false
    end
  end

end
