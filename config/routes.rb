Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  root 'images#new'

  # This exposes all the function in the images_controller to be exposed
  resources :images

  # This can also be a way of declaring the exposed resources
  # resources :images, only: [:new, :create, :index, :show, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
