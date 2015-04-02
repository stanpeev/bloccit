Rails.application.routes.draw do
  devise_for :users
resources :advertisements

resources :posts

get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
