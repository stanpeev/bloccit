Rails.application.routes.draw do

  devise_for :users
 resources :advertisements
  resources :topics do
    resources :posts, except: [:index] do
      resources :summaries, except: [:index]
    end
  end

  resources :posts, except: [:index] do
      resources :summaries, except: [:index]
    end







   get 'about' => 'welcome#about'

    root to: 'welcome#index'
end
