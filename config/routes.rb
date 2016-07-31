Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'signup'  => 'users#new'
  resources :users

  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
