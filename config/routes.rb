Rails.application.routes.draw do
  resources :sizes
  resources :general_configs do
    get :active, on: :collection
  end
  resources :categories
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
