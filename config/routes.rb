Rails.application.routes.draw do
  root to: "pages#home"
  
  devise_for :users

  resources :experiences do
    resources :event_dates, except: [:index]
  end
end
