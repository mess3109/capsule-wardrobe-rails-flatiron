Rails.application.routes.draw do

  # resources :seasons, :only => [:index, :show]
  # resources :categories, :only => [:index, :show]

  resources :outfits do
  	resources :items, only: [:show]
  end

  get '/items/used', to: 'items#used_items'

  resources :items do
    resources :outfits, only: [:show, :new, :create, :edit]
  end

  resources :item_outfits, only: [:create, :destroy]

  root 'static#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
