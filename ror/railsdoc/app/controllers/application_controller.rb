class ApplicationController < ActionController::Base
  #protect_from_forgery
  include UsersHelper

  helper_method :require_getinfo
end
