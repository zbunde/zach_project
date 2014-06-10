Rails.application.routes.draw do
  root 'welcome#index'
  resources :sellers
  resources :listings do
    resources :tasks
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout'
  post 'logout' => 'sessions#logout'

end
