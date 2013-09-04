# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'time_tracker_categories/:id/new', :to => 'time_tracker_categories#new', :as => 'new_TimeTrackerCategories_by_parent_id'
get 'time_trackers/chart/:user_id(/:report_start_date(/:report_end_date))', :to => 'time_trackers#chart', :as => 'chart_TimeTrackers'
get 'time_trackers/:user_id/uid', :to => 'time_trackers#index'
get 'time_trackers/listchart', :to => 'time_trackers#chart_list', :as => 'list_chart_time_trackers'
post 'time_trackers/listchart', :to => 'time_trackers#chart_list', :as => 'list_chart_time_trackers'
resources :time_trackers
resources :time_tracker_categories
