# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Railsdoc::Application.initialize!

$base_uri = "/rails"
#$base_uri = ""
ActionController::Base.relative_url_root = $base_uri