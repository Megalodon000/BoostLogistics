Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # Redirects admins to their dashboard after login
  authenticate :admin do
    root to: "admin#index", as: :authenticated_root
  end

  # Redirects customers to their dashboard after login
  authenticate :customer do
    root to: "customer#index", as: :authenticated_customer_root
  end

  # Routes for admin
  namespace :admin do
    resources :trackings
    resources :bookings
    resources :customers do
      member do
        patch :approve
        patch :reject
      end
    end
    resources :blogs       # Admin can manage blogs (news)
  end  

  # Routes for customer
  namespace :customer do
    resources :blogs
    resources :bookings
    resources :trackings
  end  

  get "admin" => "admin#index"
  get "customer" => "customer#index"
end
