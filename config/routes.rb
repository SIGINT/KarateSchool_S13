Karate67272::Application.routes.draw do

  get "dojo_students/new"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  # Generated routes
  resources :events
  resources :registrations
  resources :sections
  resources :students
  resources :dojos
  resources :tournaments
  resources :sessions
  resources :dojo_students
  
  # Semi-static page routes
  match 'home' => 'home#index', :as => :home
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'home#contact', :as => :contact
  match 'privacy' => 'home#privacy', :as => :privacy
  match 'search' => 'home#search', :as => :search
  
  # Login page routes
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

  # Set the root url
  root :to => 'home#index'
  
end

