Rails.application.routes.draw do

  get 'comments/create'

  devise_for :users
  resources :users, only: [:update]
 resources :advertisements
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  resources :posts, except: [:index] do
      resources :summaries, except: [:index]
    end







   get 'about' => 'welcome#about'

    root to: 'welcome#index'
end
