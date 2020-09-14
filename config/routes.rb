Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :carts do
    member do
      get '/line_items', to: 'carts#list_line_items'
      put '/line_items/:id', to: 'carts#update_line_item'
    end
  end
  resources :line_items
  resources :customers do
    resources :carts, only: [:create, :show, :index, :destroy]
  end
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
