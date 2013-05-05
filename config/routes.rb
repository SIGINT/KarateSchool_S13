Karate67272::Application.routes.draw do

  get "tournament/index"

  get "tournament/show"

  get "tournament/new"

  get "tournament/edit"

  get "tournament/create"

  get "tournament/update"

  get "tournament/destroy"

  # Generated routes
  resources :events
  resources :registrations
  resources :sections
  resources :students
  
  # Semi-static page routes
  match 'home' => 'home#index', :as => :home
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'home#contact', :as => :contact
  match 'privacy' => 'home#privacy', :as => :privacy
  match 'search' => 'home#search', :as => :search

  # Set the root url
  root :to => 'home#index'
  
end

