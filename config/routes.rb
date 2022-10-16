Rails.application.routes.draw do

  root "home#index"
  resources :restaurants, only: [:index, :new, :create] do
    resources :restaurant_menus, only: :index
    match "restaurant_menus/new", to: "restaurant_menus#new", via: :get, as: 'new'
    match "restaurant_menus/new", to: "restaurant_menus#create", via: :post
  end
end
