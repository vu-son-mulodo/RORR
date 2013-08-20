module ApplicationHelper

  def require_getCat
    controllerName = params[:controller].capitalize
    controllerAction = params[:action]
    subject = "#{controllerName}  »  #{controllerAction}"

    if controllerAction == "index"
      subject["  »  index"]= ""
    end

    return subject
  end

end

def uri(url)
  return "#{$base_uri}#{url}"
end