Rails.application.routes.draw do
  devise_for :users
  resources :experiences
end
