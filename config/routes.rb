Kr::Application.routes.draw do
  resources :posts

  root :to => 'reports#index'

  resources :reports

  match 'search' => 'reports#search'
  match 'tagged/:tag' => 'reports#tagged', :as => :tagged_report, :via => :get

#  match '/reports', to: 'reports#index', :as => :reports, :via => :get
#  match '/reports/:id', to: 'reports#show', :as => :report, :via => :get
#  match '/reports/:id', to: 'reports#destroy', :via => :delete
#  match '/reports/new', to: 'reports#new', :as => :new_report, :via => :get

  match '/settings/edit', to: 'settings#edit', :as => :edit_setting, :via => :get
  match '/settings/update', to: 'settings#update', :as => :update_setting, :via => :put

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
