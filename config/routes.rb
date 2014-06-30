Rails.application.routes.draw do
  root 'welcome#index'
  resources :companies
  resources :owners

  resources :listings do
    resources :tasks
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout'
  post 'logout' => 'sessions#logout'

  get 'password_reset' => 'authentication#change_password'
  put 'password_reset' => 'authentication#update_password'

end
