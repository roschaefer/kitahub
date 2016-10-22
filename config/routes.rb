Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'staticpages/imprint', as: 'imprint'
  get 'staticpages/terms', as: 'terms'
  get 'staticpages/privacy', as: 'privacy'

  get 'signup', to: 'users#new'
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'nurseries', to: 'nurseries#index'
  get 'nurseries/results', to: 'nurseries#results'

  get 'registration/:id', to: 'registration#index'
  get 'registration/:id/confirmation',
      to: 'registration#confirmation',
      as: 'registration_confirmation'
  post 'registration/:id', to: 'registration#create'
end
