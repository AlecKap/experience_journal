Rails.application.routes.draw do
  root to: "pages#home"
  
  devise_for :users

  resources :experiences do
    resources :entry_dates, except: [:index] do
      resources :events, except: [:index] do
        resources :descriptions, except: [:index]
      end
    end
  end
end
