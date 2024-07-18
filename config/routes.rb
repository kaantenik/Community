Rails.application.routes.draw do
  resources :clubs
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

   root "clubs#index"
end
