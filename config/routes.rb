Rails.application.routes.draw do
  root 'welcome#index'
  resources :companies
  resources :listings do
    resources :tasks
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout'
  post 'logout' => 'sessions#logout'

  get 'password_reset/:token' => 'authentication#change_password'
  post 'password_reset' => 'authentication#update_password'

end
