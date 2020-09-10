Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  } 
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :users, only: :index 
  
  resources :cards, only: [:new, :create] 

  resources :items, only: [:index, :order] do
    post 'order', on: :member
  end

  root to: "users#index"

end
