Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :groups
    end
  end

  resources :groups, only: [:index, :show, :new, :create, :edit, :update]
  resources :users_groups_relationships, only: [:create, :destroy]
end
