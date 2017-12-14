Rails.application.routes.draw do
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
