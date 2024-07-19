Rails.application.routes.draw do
  devise_for :users

  resources :clubs do
    member do
      get :members
      get :membership_requests
      patch :approve_membership_request
      delete :reject_membership_request
    end
  end

  resources :membership_requests, only: [:new, :create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  root "clubs#index"
end
