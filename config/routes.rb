Planets::Application.routes.draw do
  root :to => "top#index"
  
  resources :announcements
end
