Rails.application.routes.draw do
  root to: "branches#index"

  resources :branches do
    resources :schedules
  end

  resources :users
end
