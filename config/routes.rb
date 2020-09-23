Rails.application.routes.draw do
  resources :sessions, only: [:create]
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#is_logged_in?'
  put 'products/:id/increment', to: 'products#increment'
  put 'products/:id/decrement', to: 'products#decrement'
  resources :carts do
    member do
      get '/line_items', to: 'carts#list_line_items'
      put '/line_items/:id', to: 'carts#update_line_item'
      delete '/line_items', to: 'carts#clear_cart'
    end
  end
  resources :line_items
  resources :customers do
    resources :carts, only: [:create, :show, :index, :destroy]
  end
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
