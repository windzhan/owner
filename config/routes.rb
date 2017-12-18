Rails.application.routes.draw do
  

  namespace :admins do
    root 'users#index'
    resources :users do
      collection do
        match 'search' => 'users#search', via: [:get, :post], as: :search
      end
    end
  end

  resources :posts do
    resources :comments
  end
  
  resources :categories
  
  resources :users

  resources :homepages, :only => [:index]
  
  get 'sessions/new', to: 'sessions#new', as: :new_session

  post 'sessions', to: 'sessions#create', as: :sessions

  delete 'sessions/:id', to: 'sessions#destroy', as: :session




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
