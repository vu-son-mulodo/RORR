require 'spec_helper'

describe Blog do
  fixtures :blogs

  context :validate_nil do

	it ".validate_nil" do
	  expect(Blog.create).to have(0).error_on(:title, :context => :create)
	  expect(Blog.create).to have(0).error_on(:content, :context => :create)
	  expect(Blog.create).to have(0).error_on(:update, :context => :create)
	end

	it ".getData" do
	  Blogs = Blog.find(1)
	  date = Blogs.updated_at
	  puts date
	  puts Fdate.string2Datez(date)
	end

  end

end
