module BlogsHelper
  def page_title
    @title || nil
  end

  def bool
    true
  end

  def nameHelperDefault
    "RSpec is your friend"
  end

  def hpsearch(key)

    unless key.nil?
      @blogs = Blog.find(:all, :conditions => ["title LIKE ?","%" << key << "%"])
    else
      @blogs = Blog.all
    end

    return @blogs
  end

end
