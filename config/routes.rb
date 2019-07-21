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
  resources :categories, only: [:new, :create, :edit, :update, :destroy]
  resources :expenses, only: [:new, :create, :destroy, :show] do
    member do
      get :group
      get :user
    end
  end
  # resources :UserExpense, only: [:new, :create, :destroy, :show], controller: :expenses
  # resources :GroupExpense, only: [:new, :create, :destroy, :show], controller: :expenses
end
