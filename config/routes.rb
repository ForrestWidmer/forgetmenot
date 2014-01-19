Teststrap::Application.routes.draw do
  resources :people

  match 'getting-started', :as => :getting_started, :controller => :bootstrap, :action => :getting_started
  match 'scaffolding' => 'bootstrap#scaffolding'
  match 'base-css', :as => :base_css, :controller => :bootstrap, :action => :base_css
  match 'components' => 'bootstrap#components'
  match 'javascript' => 'bootstrap#javascript'
  match 'customize' => 'bootstrap#customize'

  root :to => 'bootstrap#index'

end
