PlanIt::Application.routes.draw do
  resources :activities do 
    resources :trips, only: [:create]
  end
  resources :trips do 
    resources :activities, only: [:new, :create]
  end
  post '/trips/:id/activity/' => 'trips#add_activity', :as => :add_activity
  delete '/trips/:id/activity/:activity_id' => 'trips#delete_activity', :as => :delete_activity
  # map '/' to be a redirect to '/activities'
  root :to => redirect('/trips')
end
