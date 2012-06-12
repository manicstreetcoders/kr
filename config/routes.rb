Kr::Application.routes.draw do
  get "welcome/index"

  get "static_pages/home"

  root to: 'welcome#index'
end
