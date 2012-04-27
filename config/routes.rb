Planets::Application.routes.draw do
  root :to => "top#index"
  
  resources :announcements
  
  namespace :api do
    resources :announcements, :only => [ :index ]
  end
end
