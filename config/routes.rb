Hiddenhook::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, skip: [:registrations]

  root to: "static#index"
  resources :charges

  resources :products, only: [:show] do
    resources :line_items, only: [:create]
  end
  post '/empty_cart' => 'line_items#destroy', as: 'empty_cart'
end
