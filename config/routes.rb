Kr::Application.routes.draw do
  devise_for :users

  get "welcome/index"

  get "static_pages/home"

  root :to => 'welcome#index'
end
