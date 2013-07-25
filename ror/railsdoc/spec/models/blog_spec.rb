require 'spec_helper'

describe Blog do
  fixtures :blogs

  context :validate do

	it ".validate_nil" do
	  expect(Blog.create).to have(1).error_on(:title, :context => :create)
	  expect(Blog.create).to have(1).error_on(:content, :context => :create)
	end

	it ".validate_max(255)" do
	  expect(Blog.create(:title => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbcccccc")).to have(1).error_on(:title, :context => :create)
	end

  end

  context :update do
	it "fails validation with no title (using error_on)" do
    expect(Blog.new).to have(1).error_on(:title)
    expect(Blog.new).to have(1).error_on(:content)
  end
  end

end
