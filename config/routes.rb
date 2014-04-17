Hiddenhook::Application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: {sessions: 'sessions'}
  devise_scope :user do
    delete "logout" => "devise/sessions#destroy", as: "logout"
  end
  mount RailsAdmin::Engine => '/portal', as: 'rails_admin'

  root to: "static#index"
  resources :charges

  resources :products, only: [:show] do
    resources :line_items, only: [:create]
  end
  post '/empty_cart' => 'line_items#destroy', as: 'empty_cart'
end
