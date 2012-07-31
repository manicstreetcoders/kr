Kr::Application.routes.draw do
  resources :posts

  root :to => 'reports#index'

  resources :reports

  match 'search' => 'reports#search'
  match 'tagged/:tag' => 'reports#tagged', :as => :tagged_report, :via => :get

  match '/settings/edit', to: 'settings#edit', :as => :edit_setting, :via => :get
  match '/settings/update', to: 'settings#update', :as => :update_setting, :via => :put

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  match '/posts/add_new_comment' => 'posts#add_new_comment', :as => 'add_new_comment_to_posts', :via => [:post]

  resources :posts do
    resources :comments
  end
end
