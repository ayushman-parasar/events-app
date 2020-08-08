Rails.application.routes.draw do
  resources :categories
  root "events#index"
  
  get "events/filter/:filter" => "events#index",as: :filtered_events

  resources :events do 
    resources :registrations
    resources :likes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  resource :session, only:[ :create, :index,:destroy, :new]
  
  # get "session" => "sessions#new"
  
  get "signup" => "users#new"

  # get "events" => "events#index"
  # get "events/:id" => "events#show", as: 'event'
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # get "events/new" => "events#create"
  # patch "events/:id" => "events#update"
end
