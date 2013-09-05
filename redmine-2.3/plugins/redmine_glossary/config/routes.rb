# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'glossary/:id/index', :to => 'glossary#index'
get 'glossary/:id/import_csv', :to => 'glossary#import_csv'
get 'glossary/:id/add_term_category', :to => 'glossary#add_term_category'
get 'glossary/:id/import_csv_exec', :to => 'glossary#import_csv_exec'
get 'glossary/:id/index_clear', :to => 'glossary#index_clear'
get 'glossary/:id/preview', :to => 'glossary#preview'
get 'glossary/:id/new', :to => 'glossary#new'
get 'glossary/:id/move_all', :to => 'glossary#move_all'
get 'glossary/:id/show', :to => 'glossary#show'
get 'glossary/:id/edit', :to => 'glossary#edit'

get 'glossary_styles/:id/search', :to => 'glossary_styles#search'
get 'glossary_styles/:id/edit', :to => 'glossary_styles#edit'

get 'term_categories/:id', :to => 'term_categories#index'
get 'term_categories/:id/change_order', :to => 'term_categories#change_order'
get 'term_categories/:id/edit', :to => 'term_categories#edit'

post 'glossary/:id/preview', :to => 'glossary#preview'
post 'glossary/:id/new', :to => 'glossary#new', :as => 'terms'
post 'glossary/:id/add_term_category', :to => 'glossary#add_term_category'
post 'glossary/:id/import_csv_exec', :to => 'glossary#import_csv_exec'
post 'glossary/:id/destroy', :to => 'glossary#destroy'

post 'term_categories/:id/change_order', :to => 'term_categories#change_order'
post 'term_categories/:id/destroy', :to => 'term_categories#destroy'

post 'glossary_styles/:id/edit', :to => 'glossary_styles#edit'

put  'glossary/:id/preview', :to => 'glossary#preview'
put  'glossary/:id/edit', :to => 'glossary#edit'

put  'glossary_styles/:id/edit', :to => 'glossary_styles#edit'

put  'term_categories/:id/edit', :to => 'term_categories#edit'

