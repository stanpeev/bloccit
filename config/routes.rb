Rails.application.routes.draw do

  get 'comments/create'

  devise_for :users
  resources :users, only: [:update]
 resources :advertisements
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
      resources :summaries, except: [:index]
    end
  end









   get 'about' => 'welcome#about'

    root to: 'welcome#index'
end
