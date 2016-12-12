Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'impressum', to: 'staticpages#imprint', as: 'imprint'
  get 'agb', to: 'staticpages#terms', as: 'terms'
  get 'datenschutz', to: 'staticpages#privacy', as: 'privacy'

  get 'signup', to: 'users#new'
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :nurseries, path: 'kita', param: :url_name do
    get 'platz-anfragen',
        to: 'nurseries#first_request',
        as: 'first_request'
    post 'platz-anfragen',
         to: 'nurseries#send_first_request',
         as: 'send_first_request'
  end

  get 'nurseries/results', to: 'nurseries#results'
end
