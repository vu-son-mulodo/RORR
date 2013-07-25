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
end
