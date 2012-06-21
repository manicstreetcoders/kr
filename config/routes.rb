Kr::Application.routes.draw do
  get "reports/index"

  match '/settings/edit', to: 'settings#edit', :as => :edit_setting, :via => :get
  match '/settings/update', to: 'settings#update', :as => :update_setting, :via => :put

  devise_for :users

  root :to => 'reports#index'
end
