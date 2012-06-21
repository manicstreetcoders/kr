Kr::Application.routes.draw do
  match '/settings/edit', to: 'settings#edit', :as => :edit_setting
  match '/settings/update', to: 'settings#update', :as => :update_setting

  devise_for :users

  get "welcome/index"

  root :to => 'welcome#index'
end
