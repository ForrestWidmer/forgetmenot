Forgetmenot::Application.routes.draw do
  
  resources :texts

  root to: 'welcome#index'

  get "contact/new"

  get "contact/create"

  get "welcome/about"

  get "welcome/referral"

  #resources :people

  #match 'getting-started', :as => :getting_started, :controller => :bootstrap, :action => :getting_started
  #match 'scaffolding' => 'bootstrap#scaffolding'
  #match 'base-css', :as => :base_css, :controller => :bootstrap, :action => :base_css
  #match 'components' => 'bootstrap#components'
  #match 'javascript' => 'bootstrap#javascript'
  #match 'customize' => 'bootstrap#customize'

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  resources "contact", only: [:new, :create]


end
