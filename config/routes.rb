Rails.application.routes.draw do
  # resources :ingredients
  root to: 'cocktails#new'
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
