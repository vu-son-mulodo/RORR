class ApplicationController < ActionController::Base
  #protect_from_forgery
  include UsersHelper, ApplicationHelper
  helper_method :require_getinfo, :require_getCat

end
