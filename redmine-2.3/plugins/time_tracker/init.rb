Redmine::Plugin.register :time_tracker do
  name 'Time Tracker plugin'
  author 'Mulodo Vietnam R&I team'
  description 'This is a plugin for managing Time Tracker'
  version '0.0.1'
  url ''
  author_url ''

  menu :top_menu, :TimeTrackers, { :controller => 'time_trackers', :action => 'index' }, :caption => 'Time Trackers',:if => Proc.new { User.current.logged? }
  menu :admin_menu, :TimeTrackerCategories, { :controller => 'time_tracker_categories', :action => 'index' }, :caption => 'Time Tracker Categories'
end
