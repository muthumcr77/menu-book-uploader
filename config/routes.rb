# frozen_string_literal: true

Rails.application.routes.draw do

  root "home#index"
  resources :restaurants, only: [:index, :new, :create] do
    resources :restaurant_menus, only: :index
    match "restaurant_menus/new", to: "restaurant_menus#new", via: :get, as: "new_menu"
    match "restaurant_menus/new", to: "restaurant_menus#create", via: :post
    match "restaurant_menus/show", to: "restaurant_menus#show", via: :get
  end
end
