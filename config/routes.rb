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

  scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do
    resources :nurseries, path: 'kita', param: :url_name do
      resources :registrations, path: 'anmeldung', only: [:new, :create]
    end
  end

  get 'nurseries/results', to: 'nurseries#results'
end
