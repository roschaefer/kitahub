Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'staticpages/imprint', as: 'imprint'
  get 'staticpages/terms', as: 'terms'
  get 'staticpages/privacy', as: 'privacy'

  get 'signup' => 'users#new'
  resources :users

  get 'login'  => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'nurseries' => 'nurseries#index'
  get 'nurseries/results' => 'nurseries#results'

  get 'registration' => 'registration#index'
end
