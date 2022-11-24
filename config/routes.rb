Rails.application.routes.draw do
  root "home#index"

  resources :branches do
    resources :schedules
  end

  resources :users
end
