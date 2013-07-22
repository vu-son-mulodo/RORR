require 'spec_helper'

describe Blog do
  fixtures :blogs

  context :validate_nil do

	it ".validate_nil" do
	  expect(Blog.create).to have(1).error_on(:title, :context => :create)
	  expect(Blog.create).to have(1).error_on(:content, :context => :create)
	end

  end

end
