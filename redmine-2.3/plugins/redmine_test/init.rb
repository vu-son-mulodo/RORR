require 'glossary_asset_tag_helper_patch'
require 'labelled_form_for'
require 'term_link_helper'

Redmine::Plugin.register :redmine_test do
  name 'Redmine Test plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  settings :default => {'empty' => true}, :partial => 'settings/test_settings'
end
