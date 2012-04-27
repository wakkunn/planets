Planets::Application.routes.draw do
  get "groups/index"

  root :to => "top#index"
  
  resources :announcements
  
  namespace :api do
    resources :announcements, :only => [ :index ]
    resources :groups, :only => [:index]
  end
end
