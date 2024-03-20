Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experiences do
    resources :entry_dates, except: [:index] do
      resources :events, except: [:index] do
        resources :descriptions, except: [:index]
      end
    end
  end
end
